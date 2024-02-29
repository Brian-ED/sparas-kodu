#!/bin/bash
echo "$(dirname "$0")/server"
cd "$(dirname "$0")/server"
sudo cp -rf ../html /var/www/
node echo.js 1>/dev/null 2>/dev/null & disown > processLoc.txt