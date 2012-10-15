#!/usr/bin/env bash

# PHP 5.4
# http://www.barryodonovan.com/index.php/2012/05/22/ubuntu-12-04-precise-pangolin-and-php-5-4-again

echo >> /etc/apt/sources.list 
echo "deb http://ppa.launchpad.net/ondrej/php5/ubuntu precise main"  >> /etc/apt/sources.list
echo "deb-src http://ppa.launchpad.net/ondrej/php5/ubuntu precise main"  >> /etc/apt/sources.list 

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

apt-get install --force-yes -y nginx percona-server-server-5.5 percona-server-client-5.5 php5-cli php5-fpm php-pear 
apt-get install --force-yes -y vim htop mc git

# Creating website folder
mkdir /var/www
chown www-data /var/www

# Nginx default site
mkdir /var/www/default
chown www-data /var/www/default
wget -P /etc/nginx/sites-enabled/ https://raw.github.com/alexzaporozhets/LNMP/master/etc/nginx/sites-enabled/default
wget -P /var/www/default/ https://raw.github.com/alexzaporozhets/LNMP/master/var/www/default/index.php


# PHPUnit
pear config-set auto_discover 1
pear channel-discover pear.symfony.com
pear channel-discover pear.phpunit.de
pear install --alldeps phpunit/PHPUnit

# ZendFramework
wget http://packages.zendframework.com/releases/ZendFramework-1.12.0/ZendFramework-1.12.0-minimal.tar.gz
mkdir /usr/local/zend
mkdir /usr/local/zend/share
tar -C /usr/local/zend/share -zxvf ZendFramework-1.12.0-minimal.tar.gz
ln -s /usr/local/zend/share/ZendFramework-1.12.0-minimal/bin/zf.sh /usr/local/bin/zf

# Samba
apt-get install --force-yes -y samba
