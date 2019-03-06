# Kimai 2 app for YunoHost

[![Integration level](https://dash.yunohost.org/integration/kimai2.svg)](https://ci-apps.yunohost.org/jenkins/job/kimai2%20%28Community%29/lastBuild/consoleFull)  
[![Install kimai2 with YunoHost](https://install-app.yunohost.org/install-with-yunohost.png)](https://install-app.yunohost.org/?app=kimai2)<br>

Shipped Version: **0.8.1 (pre-release)**

**Please note that this app will install PHP 7.2**

- [YunoHost project](https://yunohost.org)
- [Kimai 2](https://v2.kimai.org)
- [Kimai 2 source code at Github](https://github.com/kevinpapst/kimai2)

## Introduction

This is the reloaded version of the open source timetracker Kimai. Right now its in an early development phase, its usable but some advanced features from Kimai v1 are missing by now.

Kimai v2 has nothing in common with its predecessor Kimai v1 besides the basic ideas of time-tracking and the current development team. It is based on a lot of great frameworks. Special thanks to Symfony v4, Doctrine, AdminThemeBundle (based on AdminLTE).

## Installation

### Guidelines 

 1. Require dedicated domain like **kimai.domain.tld**.
 1. No LDAP support (blocked until upstream implements it)
 1. This app is multi-instance (you can have more then one Kimai instance running on a YunoHost server)
 
 ### Install

 1. **App can be installed by YunoHost admin interface or by the following command:**

         $ sudo yunohost app install https://github.com/YunoHost-Apps/kimai2_ynh
 1. Login details will be sent to the admin email.
