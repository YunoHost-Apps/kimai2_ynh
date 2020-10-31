# Kimai2 app for YunoHost

[![Integration level](https://dash.yunohost.org/integration/kimai2.svg)](https://dash.yunohost.org/appci/app/kimai2)
[![Install kimai2 with YunoHost](https://install-app.yunohost.org/install-with-yunohost.png)](https://install-app.yunohost.org/?app=kimai2)

> *This package allow you to install kimai2 quickly and simply on a YunoHost server.
If you don't have YunoHost, please see [here](https://yunohost.org/#/install) to know how to install and enjoy it.*

## Overview
This is the reloaded version of the open source timetracker Kimai. Right now its in an early development phase, its usable but some advanced features from Kimai v1 are missing by now.

Kimai v2 has nothing in common with its predecessor Kimai v1 besides the basic ideas of time-tracking and the current development team. It is based on a lot of great frameworks. Special thanks to Symfony v4, Doctrine, AdminThemeBundle (based on AdminLTE).
https://github.com/kevinpapst/kimai2

Shipped Version: **1.11.1**

## Screenshots

![](https://www.kimai.org/images/screenshots/time-tracking.png)

## Demo

* [Official demo](https://www.kimai.org/demo/)

### Guidelines

 1. Require dedicated domain like **kimai.domain.tld**.
 1. This app is multi-instance (you can have more then one Kimai instance running on a YunoHost server)

## Documentation

 * Official documentation: https://www.kimai.org/documentation

## YunoHost specific features

#### Multi-users support

LDAP is supported
HTTP auth is not supported
Defaul Kimai2 roles are:
* ROLE_USER
* ROLE_TEAMLEAD => Kimai2 (Teamlead) YunoHost permission
* ROLE_ADMIN => Kimai2 (Admin) YunoHost permission
* ROLE_SUPER_ADMIN => Kimai2 (Super_Admin) YunoHost permission
Those roles are directly managed using YunoHost permission system. User choosen during installation is granted the ROLE_SUPER_ADMIN

#### Supported architectures

* x86-64b - [![Build Status](https://ci-apps.yunohost.org/ci/logs/kimai2%20%28Apps%29.svg)](https://ci-apps.yunohost.org/ci/apps/kimai2/)
* ARMv8-A - [![Build Status](https://ci-apps-arm.yunohost.org/ci/logs/kimai2%20%28Apps%29.svg)](https://ci-apps-arm.yunohost.org/ci/apps/kimai2/)

## Links

 * Report a bug: https://github.com/YunoHost-Apps/kimai2_ynh/issues
 * App website: https://www.kimai.org/
 * Upstream app repository: https://github.com/kevinpapst/kimai2
 * YunoHost website: https://yunohost.org/

---

Developers info
----------------

Please do your pull request to the [testing branch](https://github.com/YunoHost-Apps/kimai2_ynh/tree/testing).

To try the testing branch, please proceed like that.
```
sudo yunohost app install https://github.com/YunoHost-Apps/kimai2_ynh/tree/testing --debug
or
sudo yunohost app upgrade kimai2 -u https://github.com/YunoHost-Apps/kimai2_ynh/tree/testing --debug
```
