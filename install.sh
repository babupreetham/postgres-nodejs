#!/bin/sh
# Make sure only root can run our script
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

# Update System
echo '[1] Updating System'
apt-get -y update > /dev/null 2>&1

# Install help app
echo '[2] Installing packages'
echo '-- LibSSL'
apt-get -y install libssl-dev > /dev/null 2>&1

echo '-- git-core'
apt-get -y install git-core > /dev/null 2>&1

echo '-- pkg-config'
apt-get -y install pkg-config > /dev/null 2>&1

echo '-- Essential packages'
apt-get -y install build-essential > /dev/null 2>&1

echo '-- CURL'
apt-get -y curl > /dev/null 2>&1

echo '-- GCC'
apt-get -y gcc > /dev/null 2>&1

echo '-- G++'
apt-get -y g++ > /dev/null 2>&1

# Download & Unpack Node.js
echo '[3] Creating temporary build paths'
mkdir /tmp/node-install
cd /tmp/node-install

echo '[4] Fetching the latest NodeJS Build'
wget http://nodejs.org/dist/latest/node-v0.6.19.tar.gz > /dev/null 2>&1
tar -zxf node-v0.6.19.tar.gz

cd node-v0.6.19

# Install Node.js
echo '[5] Configuring Node.JS'
./configure > /dev/null 2>&1

echo '[6] Compiling NodeJS (This may take a while)'
make > /dev/null 2>&1

echo '[7] Installing NodeJS'
make install > /dev/null 2>&1

echo '[8] Cleaning temporary files'
rm -rf /tmp/node-install > /dev/null 2>&1

echo '[-] Node.js install completed'
