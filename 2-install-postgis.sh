#!/bin/bash

cd /usr/local/src
wait
sudo wget http://download.osgeo.org/postgis/source/postgis-2.1.4.tar.gz
wait
sudo tar -xvzf postgis-2.1.4.tar.gz
wait
cd postgis-2.1.4
wait
sudo ./configure --with-raster --with-topology
wait
sudo make
wait
sudo make install

echo ""
echo "install-postgis finished."


