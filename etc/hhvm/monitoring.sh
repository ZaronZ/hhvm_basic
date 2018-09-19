#! /bin/bash
ONLINE="`timeout -s KILL 3 wget -T 3 -q -O -  http://127.0.0.1:80/hhvm/ping.php`"
if [ "$ONLINE" != "online" ]
then
    echo "HHVM is down! Restarting..."
    /etc/init.d/hhvm stop
    /etc/init.d/hhvm start
fi