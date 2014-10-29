#!/bin/bash

function pause(){
   echo ""
   read -p "|}==}-> $*"
}

pause "getting from git..."

git clone git://github.com/CartoDB/CartoDB-SQL-API.git
cd CartoDB-SQL-API
git checkout master

pause "install"
npm install
cp config/environments/development.js.example config/environments/development.js
cd ..

echo "finished."
