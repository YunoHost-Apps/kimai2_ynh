<!--
Ohart ongi: README hau automatikoki sortu da <https://github.com/YunoHost/apps/tree/master/tools/readme_generator>ri esker
EZ editatu eskuz.
-->

# Kimai2 YunoHost-erako

[![Integrazio maila](https://dash.yunohost.org/integration/kimai2.svg)](https://ci-apps.yunohost.org/ci/apps/kimai2/) ![Funtzionamendu egoera](https://ci-apps.yunohost.org/ci/badges/kimai2.status.svg) ![Mantentze egoera](https://ci-apps.yunohost.org/ci/badges/kimai2.maintain.svg)

[![Instalatu Kimai2 YunoHost-ekin](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=kimai2)

*[Irakurri README hau beste hizkuntzatan.](./ALL_README.md)*

> *Pakete honek Kimai2 YunoHost zerbitzari batean azkar eta zailtasunik gabe instalatzea ahalbidetzen dizu.*  
> *YunoHost ez baduzu, kontsultatu [gida](https://yunohost.org/install) nola instalatu ikasteko.*

## Aurreikuspena

Kimai v2 has nothing in common with its predecessor Kimai v1 besides the basic ideas of time-tracking and the current development team. It is based on a lot of great frameworks. Special thanks to Symfony v4, Doctrine, AdminThemeBundle (based on AdminLTE).


**Paketatutako bertsioa:** 2.24.0~ynh1

**Demoa:** <https://www.kimai.org/demo/>

## Pantaila-argazkiak

![Kimai2(r)en pantaila-argazkia](./doc/screenshots/screenshot1.png)

## Dokumentazioa eta baliabideak

- Aplikazioaren webgune ofiziala: <https://www.kimai.org>
- Administratzaileen dokumentazio ofiziala: <https://www.kimai.org/documentation/>
- Jatorrizko aplikazioaren kode-gordailua: <https://github.com/kevinpapst/kimai2>
- YunoHost Denda: <https://apps.yunohost.org/app/kimai2>
- Eman errore baten berri: <https://github.com/YunoHost-Apps/kimai2_ynh/issues>

## Garatzaileentzako informazioa

Bidali `pull request`a [`testing` abarrera](https://github.com/YunoHost-Apps/kimai2_ynh/tree/testing).

`testing` abarra probatzeko, ondorengoa egin:

```bash
sudo yunohost app install https://github.com/YunoHost-Apps/kimai2_ynh/tree/testing --debug
edo
sudo yunohost app upgrade kimai2 -u https://github.com/YunoHost-Apps/kimai2_ynh/tree/testing --debug
```

**Informazio gehiago aplikazioaren paketatzeari buruz:** <https://yunohost.org/packaging_apps>
