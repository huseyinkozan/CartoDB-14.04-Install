#!/bin/bash

function pause(){
   read -p "$*"
}

function rm_dir(){
    pause "---> rm_dir $1"
    if [ -d $1 ]; then
        pause "---> sudo rm -rf $1"
        sudo rm -rf $1
    fi
}


echo ""
pause "install python dev and build tools..."

sudo apt-get install \
python2.7-dev build-essential python-setuptools

echo ""
pause "use txt file to install python deps..."

sudo -s <<ENDCOMMANDS
echo "starting pip install..."
easy_install pip
export CPLUS_INCLUDE_PATH=/usr/include/gdal
export C_INCLUDE_PATH=/usr/include/gdal
pip install --no-use-wheel -r cartodb/python_requirements.txt
echo "finished pip install."
ENDCOMMANDS
