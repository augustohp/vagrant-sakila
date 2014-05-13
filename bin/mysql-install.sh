#!/usr/bin/env bash
#
# MySQL installation for Ubuntu 12.04.
# Installs the Sakilla database.
# Author: Augusto Pascutti <augustohp@gmail.com>

set -e
set -o pipefail

declare -r DEBUG="false"
declare -r APT_OPTIONS="-qq"
declare -r APT_INSTALL_PACKAGES="wget mysql-server mysql-client"
declare -r MYSQL_SAKILA_SOURCE="http://downloads.mysql.com/docs/sakila-db.tar.gz"
declare -r MYSQL_SAKILA_TAR="/tmp/sakila-db.tar.gz"
declare -r MYSQL_SAKILA_EXTRACTED="/home/vagrant"
declare -r MYSQL_CLIENT_ARGS="-uroot -hlocalhost"

[[ $DEBUG = "true" ]] && set -x

echo 'Checking required packages...'
export DEBIAN_FRONTEND="noninteractive"
apt-get $APT_OPTIONS update
apt-get $APT_OPTIONS install -y $APT_INSTALL_PACKAGES
echo 'Dependencies installed.'

echo "Checking for sakila database existance..."
if [ ! 7 -eq `mysql -uroot -e "show databases" | grep sakila | wc -c` ]; then
    [[ ! -f $MYSQL_SAKILA_TAR ]] && wget --quiet -O $MYSQL_SAKILA_TAR $MYSQL_SAKILA_SOURCE
    tar -zxf $MYSQL_SAKILA_TAR -C $MYSQL_SAKILA_EXTRACTED
    SAKILA_SCHEMA="$MYSQL_SAKILA_EXTRACTED/sakila-db/sakila-schema.sql"
    SAKILA_DATA="$MYSQL_SAKILA_EXTRACTED/sakila-db/sakila-data.sql"
    mysql $MYSQL_CLIENT_ARGS < $SAKILA_SCHEMA
    mysql $MYSQL_CLIENT_ARGS < $SAKILA_DATA
fi;
echo "Sakila database installed on MySQL."
