#!/bin/bash
echo "$(dirname "$0")/server"
cd "$(dirname "$0")/server"
sudo cp -rf ../html /var/www/
node echo.js 0 & disown