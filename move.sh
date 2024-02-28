#!/bin/bash
cd "$(dirname "$0")"
rm -rf /var/www/html
cp -a html /var/www/