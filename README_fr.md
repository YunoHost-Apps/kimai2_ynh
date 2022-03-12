# Kimai2 pour YunoHost

[![Niveau d'intégration](https://dash.yunohost.org/integration/kimai2.svg)](https://dash.yunohost.org/appci/app/kimai2) ![](https://ci-apps.yunohost.org/ci/badges/kimai2.status.svg) ![](https://ci-apps.yunohost.org/ci/badges/kimai2.maintain.svg)  
[![Installer Kimai2 avec YunoHost](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=kimai2)

*[Read this readme in english.](./README.md)*
*[Lire ce readme en français.](./README_fr.md)*

> *Ce package vous permet d'installer Kimai2 rapidement et simplement sur un serveur YunoHost.
Si vous n'avez pas YunoHost, regardez [ici](https://yunohost.org/#/install) pour savoir comment l'installer et en profiter.*

## Vue d'ensemble

This is the reloaded version of the open source timetracker Kimai. Right now its in an early development phase, its usable but some advanced features from Kimai v1 are missing by now.

Kimai v2 has nothing in common with its predecessor Kimai v1 besides the basic ideas of time-tracking and the current development team. It is based on a lot of great frameworks. Special thanks to Symfony v4, Doctrine, AdminThemeBundle (based on AdminLTE).


**Version incluse :** 1.18.2~ynh1

**Démo :** https://www.kimai.org/demo/

## Captures d'écran

![](./doc/screenshots/screenshot1.png)

## Avertissements / informations importantes

* Require dedicated domain like **kimai.domain.tld**.
* This app is multi-instance (you can have more then one Kimai instance running on a YunoHost server)

#### Multi-user support

LDAP is supported
HTTP auth is not supported

Defaul Kimai2 roles are:
* ROLE_USER
* ROLE_TEAMLEAD => Kimai2 (Teamlead) YunoHost permission
* ROLE_ADMIN => Kimai2 (Admin) YunoHost permission
* ROLE_SUPER_ADMIN => Kimai2 (Super_Admin) YunoHost permission
Those roles are directly managed using YunoHost permission system. User choosen during installation is granted the ROLE_SUPER_ADMIN

## Documentations et ressources

* Site officiel de l'app : https://www.kimai.org
* Documentation officielle de l'admin : https://www.kimai.org/documentation/
* Dépôt de code officiel de l'app : https://github.com/kevinpapst/kimai2
* Documentation YunoHost pour cette app : https://yunohost.org/app_kimai2
* Signaler un bug : https://github.com/YunoHost-Apps/kimai2_ynh/issues

## Informations pour les développeurs

Merci de faire vos pull request sur la [branche testing](https://github.com/YunoHost-Apps/kimai2_ynh/tree/testing).

Pour essayer la branche testing, procédez comme suit.
```
sudo yunohost app install https://github.com/YunoHost-Apps/kimai2_ynh/tree/testing --debug
ou
sudo yunohost app upgrade kimai2 -u https://github.com/YunoHost-Apps/kimai2_ynh/tree/testing --debug
```

**Plus d'infos sur le packaging d'applications :** https://yunohost.org/packaging_apps