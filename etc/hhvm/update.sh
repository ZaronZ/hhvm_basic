#! /bin/bash
echo "HHVM update..."
apt-get update
/etc/init.d/hhvm stop
apt-get upgrade hhvm -y
/etc/init.d/hhvm start