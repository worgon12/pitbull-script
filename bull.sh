#!bin/bash
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;33m'
NC='\033[0m'

echo "${BLUE}******************** Pitbull Linux Daemon Compile Script ****************************${NC}"
echo "${GREEN}******************************* by worgon12 ****************************************${NC}"
sleep 5
echo "${RED}First of all we will System Update and install the dependencies${NC}"
sleep 5
echo "${BLUE}System Update and dependencies install!${NC}"
sleep 5
sudo apt update -y
sudo apt-get install software-properties-common -y
sudo add-apt-repository ppa:bitcoin/bitcoin -y
sudo apt-get update -y
sudo apt-get install libdb4.8-dev libdb4.8++-dev -y
sudo apt-get install git build-essential libssl1.0-dev libdb-dev libdb++-dev libboost-dev libboost-program-options-dev libboost-filesystem-dev libboost-thread-dev zlib1g-dev libqrencode-dev -y
echo "${GREEN}done${NC}"
echo "${BLUE}Download Pitbull Source Code Github and Compile${NC}"
sleep 5
git clone https://github.com/worgon12/bull
cd bull
chmod +x /src/leveldb/build_detect_platform
cd src
sudo mkdir obj 
cd leveldb
sudo make clean
sudo make libleveldb.a libmemenv.a
cd ..
sudo make -f makefile.unix USE_UPNP=-
strip pitbulld
sudo cp pitbulld /usr/local/bin
echo "${GREEN}done${NC}"
echo "${GREEN}Start the Pitbull Daemon with pitbulld${NC}"
sleep 10
exit

