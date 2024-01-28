As sqlite support ended on version 1.14, if you choosed an sqlite database during installation, Kimai2 upgrade is blocked to version 1.13.

#### Multi-user support

Defaul Kimai2 roles are:

* ROLE_USER
* ROLE_TEAMLEAD => Kimai2 (Teamlead) YunoHost permission
* ROLE_ADMIN => Kimai2 (Admin) YunoHost permission
* ROLE_SUPER_ADMIN => Kimai2 (Super_Admin) YunoHost permission

Those roles are directly managed using YunoHost permission system. User choosen during installation is granted the ROLE_SUPER_ADMIN
