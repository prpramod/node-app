#!/bin/sh
 
ssh ubuntu@52.207.122.203 <<EOF
    cd ~/node-app
    git pull origin main
    curl -o-   https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh    | bash
    . ~/.nvm/nvm.sh
    nvm install v12.18.3
    npm install
    npm install -g nodemon pm2
    pm2 restart ecosystem.config.js
    pm2 restart node-app
    pm2 ls
    exit
EOF
