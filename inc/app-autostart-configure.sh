#!/bin/bash
if [[ `systemctl` =~ -\.mount ]]; then 
    STARTUPTYPE='systemd'
    echo using systemd
    source $SCRIPTPATH/inc/app-systemd-add.sh
    source $SCRIPTPATH/$APPNAME/$APPNAME-systemd-update.sh
elif [[ -f /etc/init.d/cron && ! -h /etc/init.d/cron ]]; then 
    STARTUPTYPE='sysv-init'
    echo using sysv-init
    source $SCRIPTPATH/inc/app-init-add.sh
    source $SCRIPTPATH/$APPNAME/$APPNAME-init-update.sh
else 
    STARTUPTYPE='unknown'
    echo $RED'Unknown startup type.'$ENDCOLOR
fi
