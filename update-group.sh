#!/bin/bash

# sh update-group.sh <group-name> <enable | disable >

pihole_binary=/usr/local/bin/pihole

case "${2}" in
  "enable")
    sqlite3 /etc/pihole/gravity.db "update 'group' set 'enabled'=1 where name='${1}'";
    ;;
  "disable")
    sqlite3 /etc/pihole/gravity.db "update 'group' set 'enabled'=0 where name='${1}'";
    ;;
esac

$pihole_binary restartdns reload-lists >/dev/null

