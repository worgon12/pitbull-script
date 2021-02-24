#!bin/bash
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;33m'
NC='\033[0m'

echo "${BLUE}******************** Pitbull Linux Compile Script ****************************${NC}"
echo "${GREEN}******************************* by worgon12 ****************************************${NC}"
sleep 5
echo "${RED}First of all we will System Update and install the dependencies${NC}"
sleep 5
echo "${BLUE}System Update and dependencies install!${NC}"
sleep 5
sudo apt update -y
sudo apt-get install git build-essential libssl1.0-dev libdb++-dev autoconf libboost-all-dev libqrencode-dev autoconf libtool autotools-dev unzip
wget http://download.oracle.com/berkeley-db/db-4.8.30.zip
unzip db-4.8.30.zip
cd db-4.8.30
cd build_unix/
sudo ../dist/configure --prefix=/usr/local --enable-cxx
make
sudo make install
cd ..
cd ..
echo "${GREEN}done${NC}"
sleep 5
echo "${BLUE}Download Pitbull Source Code Github and Compile${NC}"
sleep 5
git clone https://github.com/worgon12/bull
cd bull
sudo chmod +x src/leveldb/build_detect_platform
cd src
mkdir obj 
cd leveldb
sudo make clean
sudo make libleveldb.a libmemenv.a
cd ..
sudo make -f makefile.unix USE_UPNP=-
strip pitbulld
sudo cp pitbulld /usr/local/bin/
echo "${GREEN}done${NC}"
echo "${GREEN}Start the Pitbull Daemon with pitbulld${NC}"
sleep 10
exit

