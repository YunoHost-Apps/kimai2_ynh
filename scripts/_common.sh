#!/bin/bash

# ============= FUTURE YUNOHOST HELPER =============
# Delete a file checksum from the app settings
#
# $app should be defined when calling this helper
#
# usage: ynh_remove_file_checksum file
# | arg: file - The file for which the checksum will be deleted
ynh_delete_file_checksum () {
	local checksum_setting_name=checksum_${1//[\/ ]/_}	# Replace all '/' and ' ' by '_'
	ynh_app_setting_delete $app $checksum_setting_name
}


# Create a dedicated php-fpm config
#
# usage: ynh_add_fpm_config
ynh_add_fpm7.2_config () {
	# Configure PHP-FPM 7.2 by default
	local fpm_config_dir="/etc/php/7.2/fpm"
	local fpm_service="php7.2-fpm"
	ynh_app_setting_set $app fpm_config_dir "$fpm_config_dir"
	ynh_app_setting_set $app fpm_service "$fpm_service"
	finalphpconf="$fpm_config_dir/pool.d/$app.conf"
	ynh_backup_if_checksum_is_different "$finalphpconf"
	sudo cp ../conf/php-fpm.conf "$finalphpconf"
	ynh_replace_string "__NAMETOCHANGE__" "$app" "$finalphpconf"
	ynh_replace_string "__FINALPATH__" "$final_path" "$finalphpconf"
	ynh_replace_string "__USER__" "$app" "$finalphpconf"
	sudo chown root: "$finalphpconf"
	ynh_store_file_checksum "$finalphpconf"

	if [ -e "../conf/php-fpm.ini" ]
	then
		finalphpini="$fpm_config_dir/conf.d/20-$app.ini"
		ynh_backup_if_checksum_is_different "$finalphpini"
		sudo cp ../conf/php-fpm.ini "$finalphpini"
		sudo chown root: "$finalphpini"
		ynh_store_file_checksum "$finalphpini"
	fi
	sudo systemctl reload $fpm_service
}

# Remove the dedicated php-fpm config
#
# usage: ynh_remove_fpm7.2_config
ynh_remove_fpm7.2_config () {
	local fpm_config_dir=$(ynh_app_setting_get $app fpm_config_dir)
	local fpm_service=$(ynh_app_setting_get $app fpm_service)
	ynh_secure_remove "$fpm_config_dir/pool.d/$app.conf"
	ynh_secure_remove "$fpm_config_dir/conf.d/20-$app.ini" 2>&1
	sudo systemctl reload $fpm_service
}

# Execute a command as another user
# usage: exec_as USER COMMAND [ARG ...]
exec_as() {
  local USER=$1
  shift 1

  if [[ $USER = $(whoami) ]]; then
    eval $@
  else
    # use sudo twice to be root and be allowed to use another user
    sudo sudo -u "$USER" $@
  fi
}

#
# Composer helpers
#

# Execute a composer command from a given directory
# usage: composer_exec AS_USER WORKDIR COMMAND [ARG ...]
exec_composer() {
  local WORKDIR=$1
  shift 1

  COMPOSER_HOME="${WORKDIR}/.composer" \
    sudo /usr/bin/php7.2 "${WORKDIR}/composer.phar" $@ \
      -d "${WORKDIR}"  
}

# Install and initialize Composer in the given directory
# usage: init_composer DESTDIR [AS_USER]
init_composer() {
  local DESTDIR=$1
  local AS_USER=${2:-admin}

  # install composer
  curl -sS https://getcomposer.org/installer \
    | COMPOSER_HOME="${DESTDIR}/.composer" \
        sudo /usr/bin/php7.2 -- --install-dir="$DESTDIR" \
    || ynh_die "Unable to install Composer"

  # update dependencies to create composer.lock
  exec_composer "$DESTDIR" install  --no-dev --optimize-autoloader  \
    || ynh_die "Unable to update Kimai2 core dependencies"
}

sudo_path () {
	sudo env "PATH=$PATH" $@
}

#
# php7.2 helpers
#

ynh_install_php7 () {

  ynh_package_update
  ynh_package_install apt-transport-https --no-install-recommends

  wget -q -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
  echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | sudo tee /etc/apt/sources.list.d/php7.list

  ynh_package_update
  ynh_install_app_dependencies php7.2 php7.2-zip php7.2-fpm php7.2-mysql php7.2-xml php7.2-intl php7.2-mbstring php7.2-gd php7.2-curl php7.2-bcmath php7.2-opcache php7.2-sqlite3

  sudo update-alternatives --install /usr/bin/php php /usr/bin/php5 70
}

ynh_remove_php7 () {
  sudo rm -f /etc/apt/sources.list.d/php7.list
  sudo apt-key del 4096R/89DF5277
  sudo apt-key del 2048R/11A06851
  ynh_remove_app_dependencies php7.2 php7.2-zip php7.2-fpm php7.2-mysql php7.2-xml php7.2-intl php7.2-mbstring php7.2-gd php7.2-curl php7.2-bcmath php7.2-opcache php7.2-sqlite3
}


# Send an email to inform the administrator
#
# usage: ynh_send_readme_to_admin app_message [recipients]
# | arg: app_message - The message to send to the administrator.
# | arg: recipients - The recipients of this email. Use spaces to separate multiples recipients. - default: root
#	example: "root admin@domain"
#	If you give the name of a YunoHost user, ynh_send_readme_to_admin will find its email adress for you
#	example: "root admin@domain user1 user2"
ynh_send_readme_to_admin() {
	local app_message="${1:-...No specific information...}"
	local recipients="${2:-root}"

	# Retrieve the email of users
	find_mails () {
		local list_mails="$1"
		local mail
		local recipients=" "
		# Read each mail in argument
		for mail in $list_mails
		do
			# Keep root or a real email address as it is
			if [ "$mail" = "root" ] || echo "$mail" | grep --quiet "@"
			then
				recipients="$recipients $mail"
			else
				# But replace an user name without a domain after by its email
				if mail=$(ynh_user_get_info "$mail" "mail" 2> /dev/null)
				then
					recipients="$recipients $mail"
				fi
			fi
		done
		echo "$recipients"
	}
	recipients=$(find_mails "$recipients")

	local mail_subject="☁️🆈🅽🅷☁️: \`$app\` was just installed!"

	local mail_message="This is an automated message from your beloved YunoHost server.
Specific information for the application $app.
$app_message
---
Automatic diagnosis data from YunoHost
$(yunohost tools diagnosis | grep -B 100 "services:" | sed '/services:/d')"
	
	# Define binary to use for mail command
	if [ -e /usr/bin/bsd-mailx ]
	then
		local mail_bin=/usr/bin/bsd-mailx
	else
		local mail_bin=/usr/bin/mail.mailutils
	fi

	# Send the email to the recipients
	echo "$mail_message" | $mail_bin -a "Content-Type: text/plain; charset=UTF-8" -s "$mail_subject" "$recipients"
}
