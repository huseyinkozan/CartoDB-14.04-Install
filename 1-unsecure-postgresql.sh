#!/bin/bash

echo ""
echo "Please change peer/md5 to trust. Like this:"
echo ""
echo "host     all             all             127.0.0.1/32            trust"
echo "local    all             all                                     trust"
echo ""

read -p "[Enter] to continue..."

sudo nano /etc/postgresql/9.3/main/pg_hba.conf

wait

sudo service postgresql restart

