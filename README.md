<!--
N.B.: This README was automatically generated by https://github.com/YunoHost/apps/tree/master/tools/README-generator
It shall NOT be edited by hand.
-->

# Kimai2 for YunoHost

[![Integration level](https://dash.yunohost.org/integration/kimai2.svg)](https://dash.yunohost.org/appci/app/kimai2) ![Working status](https://ci-apps.yunohost.org/ci/badges/kimai2.status.svg) ![Maintenance status](https://ci-apps.yunohost.org/ci/badges/kimai2.maintain.svg)  
[![Install Kimai2 with YunoHost](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=kimai2)

*[Lire ce readme en français.](./README_fr.md)*

> *This package allows you to install Kimai2 quickly and simply on a YunoHost server.
If you don't have YunoHost, please consult [the guide](https://yunohost.org/#/install) to learn how to install it.*

## Overview

This is the reloaded version of the open source timetracker Kimai. Right now its in an early development phase, its usable but some advanced features from Kimai v1 are missing by now.

Kimai v2 has nothing in common with its predecessor Kimai v1 besides the basic ideas of time-tracking and the current development team. It is based on a lot of great frameworks. Special thanks to Symfony v4, Doctrine, AdminThemeBundle (based on AdminLTE).


**Shipped version:** 1.27.0~ynh1

**Demo:** https://www.kimai.org/demo/

## Screenshots

![Screenshot of Kimai2](./doc/screenshots/screenshot1.png)

## Disclaimers / important information

* Require dedicated domain like **kimai.domain.tld**.
* This app is multi-instance (you can have more then one Kimai instance running on a YunoHost server)
* As sqlite support ended on version 1.14, if you choosed an sqlite databse during installation, Kimai2 upgrade is blocked to version 1.13

#### Multi-user support

LDAP is supported
HTTP auth is not supported
Defaul Kimai2 roles are:
* ROLE_USER
* ROLE_TEAMLEAD => Kimai2 (Teamlead) YunoHost permission
* ROLE_ADMIN => Kimai2 (Admin) YunoHost permission
* ROLE_SUPER_ADMIN => Kimai2 (Super_Admin) YunoHost permission
Those roles are directly managed using YunoHost permission system. User choosen during installation is granted the ROLE_SUPER_ADMIN

## Documentation and resources

* Official app website: <https://www.kimai.org>
* Official admin documentation: <https://www.kimai.org/documentation/>
* Upstream app code repository: <https://github.com/kevinpapst/kimai2>
* YunoHost documentation for this app: <https://yunohost.org/app_kimai2>
* Report a bug: <https://github.com/YunoHost-Apps/kimai2_ynh/issues>

## Developer info

Please send your pull request to the [testing branch](https://github.com/YunoHost-Apps/kimai2_ynh/tree/testing).

To try the testing branch, please proceed like that.

``` bash
sudo yunohost app install https://github.com/YunoHost-Apps/kimai2_ynh/tree/testing --debug
or
sudo yunohost app upgrade kimai2 -u https://github.com/YunoHost-Apps/kimai2_ynh/tree/testing --debug
```

**More info regarding app packaging:** <https://yunohost.org/packaging_apps>
