#!/usr/bin/env bash

# PHP 5.4
# http://www.barryodonovan.com/index.php/2012/05/22/ubuntu-12-04-precise-pangolin-and-php-5-4-again

echo >> /etc/apt/sources.list 
echo "deb http://ppa.launchpad.net/ondrej/php5/ubuntu precise main"  >> /etc/apt/sources.list

# Percona 5.5
# http://www.percona.com/doc/percona-server/5.5/installation/apt_repo.html

gpg --keyserver  hkp://keys.gnupg.net --recv-keys 1C4CBDCDCD2EFD2A
gpg -a --export CD2EFD2A | sudo apt-key add -

# Add this to /etc/apt/sources.list, replacing VERSION with the name of your distribution
echo >> /etc/apt/sources.list 
echo "deb http://repo.percona.com/apt precise main" >>  /etc/apt/sources.list
echo "deb-src http://repo.percona.com/apt precise main" >>  /etc/apt/sources.list

apt-get update --force-yes -y
apt-get upgrade --force-yes -y
apt-get dist-upgrade --force-yes -y

apt-get install --force-yes -y nginx percona-server-server-5.5 percona-server-client-5.5 php5-cli php5-fpm
