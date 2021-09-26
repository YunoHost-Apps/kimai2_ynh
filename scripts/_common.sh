#!/bin/bash

#=================================================
# COMMON VARIABLES
#=================================================

# Latest tag
latest_tag=$(curl -s https://api.github.com/repos/kevinpapst/kimai2/releases/latest | grep 'tag_name' | cut -d\" -f4)
tag="1.15.2"

YNH_PHP_VERSION="7.3"

YNH_COMPOSER_VERSION="2.0.4"

extra_php_dependencies="php${YNH_PHP_VERSION}-gd php${YNH_PHP_VERSION}-intl php${YNH_PHP_VERSION}-json php${YNH_PHP_VERSION}-mbstring php${YNH_PHP_VERSION}-pdo php${YNH_PHP_VERSION}-zip php${YNH_PHP_VERSION}-xml php${YNH_PHP_VERSION}-xsl php${YNH_PHP_VERSION}-ldap php${YNH_PHP_VERSION}-mysql php${YNH_PHP_VERSION}-sqlite3"

#=================================================
# PERSONAL HELPERS
#=================================================

#=================================================
# EXPERIMENTAL HELPERS
#=================================================

#=================================================
# FUTURE OFFICIAL HELPERS
#=================================================
