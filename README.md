## Basic HHVM with Memcached installation on Debian 9(HHVM 3.28)
`\var\www\` - default path for your web service
#### 1. Install HHVM and Memcached
```bash
apt-get update
apt-get install -y apt-transport-https software-properties-common
apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xB4112585D386EB94
add-apt-repository https://dl.hhvm.com/debian
apt-get update
apt-get install -y hhvm memcached
update-rc.d hhvm defaults
```

#### 2. Copy `php.ini` and `server.ini` to `\etc\hhvm\` from rep

#### 3. Restart HHVM and Memcached
```bash
service memcached restart
service hhvm restart
```


## AutoRestart and AutoUpdate for HHVM
`monitoring.sh` checks `127.0.0.1:80/hhvm/ping.php` every minute(and restart service if HHVM down)  
`update.sh` checks HHVM updates every 7 days
#### 1. Copy `monitoring.sh` and `update.sh` to `\etc\hhvm\` from rep
#### 2. Copy `ping.php` to `\var\www\hhvm\` from rep
#### 3. Install wget and add to cron
```bash
apt-get install -y wget
chmod +x /etc/hhvm/monitoring.sh
chmod +x /etc/hhvm/update.sh
crontab -e
```
#### 4. Add to end of cron config
```
* * * * * /bin/bash /etc/hhvm/monitoring.sh 2>&1 | logger
* * 7 * * /bin/bash /etc/hhvm/update.sh 2>&1 | logger
```
