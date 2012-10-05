#!/usr/bin/env bash

# PHP 5.4
# http://www.barryodonovan.com/index.php/2012/05/22/ubuntu-12-04-precise-pangolin-and-php-5-4-again

sudo apt-get install python-software-properties
sudo add-apt-repository ppa:ondrej/php5

apt-get update
apt-get upgrade
apt-get dist-upgrade

# Percona 5.5
# http://www.percona.com/doc/percona-server/5.5/installation/apt_repo.html

sudo apt-get install percona-server-server-5.5
sudo gpg -a --export CD2EFD2A | sudo apt-key add -

# Add this to /etc/apt/sources.list, replacing VERSION with the name of your distribution
echo "deb http://repo.percona.com/apt precise main" >>  /etc/apt/sources.list
echo "deb-src http://repo.percona.com/apt precise main" >>  /etc/apt/sources.list

sudo apt-get update
sudo apt-get install percona-server-server-5.5 percona-server-client-5.5
