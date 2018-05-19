# Dockerfile for OpenRA dedicated server

## unRAID template

The template for this docker can be found at [Mudislander/docker-templates][1]
[1]: https://raw.githubusercontent.com/Mudislander/docker-templates/master/openra.xml

## Example unRAID command
```sh

$ docker run -d --name='OpenRA' \
				--net='bridge' \
				-e TZ="Europe/London" \
				-e HOST_OS="unRAID" \
				-e 'Mod'='d2k' \
				-e 'Name'='Mudisle D2K Server' \
				-e 'Ban'='' \
				-e 'MOTD'='Welcome to Mudisle d2k Server. Have Fun!!' \
				-e 'Password'='' \
				-e 'MAP'='8dd8ad23ab49cf73cc2d52507ed684ab51e129c5' \
				-e 'AdvertiseOnline'='True' \
				-e 'EnableSingleplayer'='True' \
				-p '1234:1234/tcp' 'mudislander/openra-docker-server'

```

## Settings

| ENV  | EXAMPLE VALUE   | DESCRIPTION  | DEFAULT  |   |
|---|---|---|---|---|
| NAME  | Mudisle D2K Server  |  Server name  |   |   |
| MOTD  | Welcome to Mudisle d2k Server. Have Fun!! | MOTD, on server join   |   |   |
| EXTERNAL_PORT  | 1234  |  External port, used for server list registration  |  1234 |   |
| ADVERTISE_ONLINE  | True  | Register with public  server list |  False |   |
| MOD  | d2k  |  OpenRA Mod "Dune 2000"  | ra |   |
| MAP  | 8dd8ad23ab49cf73cc2d52507ed684ab51e129c5 | Load initial map with id, see [Resource Center][1]  |  |   |
| PASSWORD  | whatever | Password to connect |  |   |


[1]: http://resource.openra.net/maps/110

## FYI

Seems like an example server with RA-mod needs at least 500MB of memory, maybe even more.

## Copyright & License

This is a fork of [https://github.com/rmoriz/openra-dockerfile rmoriz/openra-dockerfile]

Copyright © 2014 [Roland Moriz](https://roland.io), see LICENSE.txt
