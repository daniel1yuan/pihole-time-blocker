#!/bin/bash

# sh update-group.sh <group-name> <enable | disable >

case "${2}" in
  "enable")
    sqlite3 /etc/pihole/gravity.db "update 'group' set 'enabled'=1 where name='${1}'";
    ;;
  "disable")
    sqlite3 /etc/pihole/gravity.db "update 'group' set 'enabled'=0 where name='${1}'";
    ;;
esac

/usr/local/bin/pihole restartdns reload-lists >/dev/null
