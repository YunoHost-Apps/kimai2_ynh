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
