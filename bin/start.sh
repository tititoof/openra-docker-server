#!/bin/sh
# see https://github.com/OpenRA/OpenRA/wiki/Dedicated
Name="${Name:-""}"
Mod="${Mod:-""}"
Ban=${BAN:-""}
ListenPort="${ListenPort:-"1234"}"
ExternalPort="${ExternalPort:-"1234"}"
AdvertiseOnline="${AdvertiseOnline:-""}"
EnableSingleplayer="${EnableSingleplayer:-""}"
Map="${MAP}"
Password="${Password:-""}"
MaxGameDurationMilliseconds="${MAX_GAME_DURATION_MILLISECONDS:-"7200000"}" # 2h x 60min x 60s x 1000

MOTD="${MOTD:-"welcome to a Docker based OpenRA server"}"
echo $MOTD > /home/openra/.openra/motd.txt

# if no maps volume is mounted, sync the latest maps from the community rsync service
# [ "$(ls -A /home/openra/.openra/maps/)" ] && echo "will use existing maps" || rsync --delete -ap rsync://resource.openra.net/maps/ /home/<username>/.openra/maps/

echo "=================================================================="
echo "MOD:              $Mod"
echo "BAN:              $Ban"
echo "MAP:              $Map"
echo "NAME:             $Name"
echo "PASSWORD:         $Password"
echo "SINGLE_PLAYER:    $EnableSingleplayers"
echo "EXTERNAL_PORT:    $ExternalPort"
echo "ADVERTISE_ONLINE: $AdvertiseOnline"
echo "MAX_GAME_DURATION_MILLISECONDS: $MaxGameDurationMilliseconds"
echo "=================================================================="

while true; do
     mono --debug /usr/lib/openra/OpenRA.Server.exe Game.Mod=$Mod \
     Server.Name="$Name" Server.ListenPort=$ListenPort Server.ExternalPort=$ExternalPort \
     Server.Ban="$Ban" \
     Server.TimeOut="$MaxGameDurationMilliseconds" \
     Server.AdvertiseOnline=$AdvertiseOnline \
     Server.Map=$Map \
     Server.EnableSingleplayer=$EnableSingleplayer Server.Password=$Password
done
