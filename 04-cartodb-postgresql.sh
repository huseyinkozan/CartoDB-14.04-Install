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
echo "Below commands runs one by one..."

rm_dir pg_schema_triggers

pause "---> git clone https://github.com/CartoDB/pg_schema_triggers.git"
git clone https://github.com/CartoDB/pg_schema_triggers.git
pause "---> cd pg_schema_triggers"
cd pg_schema_triggers
pause "--> sudo make all install PGUSER=postgres"
sudo make all install PGUSER=postgres
#pause "---> sudo make installcheck PGUSER=postgres # to run tests"
#sudo make installcheck PGUSER=postgres # to run tests
pause "---> cd .."
cd ..

rm_dir cartodb-postgresql

pause "---> git clone https://github.com/CartoDB/cartodb-postgresql.git"
git clone https://github.com/CartoDB/cartodb-postgresql.git
pause "---> cd cartodb-postgresql"
cd cartodb-postgresql
pause "---> git checkout cdb"
git checkout cdb
pause "---> sudo make all install"
sudo make all install
#pause "---> sudo PGUSER=postgres make installcheck # to run tests"
#sudo PGUSER=postgres make installcheck # to run tests
pause "---> cd .."
cd ..

pause "script finished. cleaning..."

rm_dir pg_schema_triggers
rm_dir cartodb-postgresql

echo "clean finished."

