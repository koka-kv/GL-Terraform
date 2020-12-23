#!/bin/bash

sudo amazon-linux-extras install nginx1 -y

server_ip=`curl http://169.254.169.254/latest/meta-data/local-ipv4`

echo "<h2>Server ip address is: $server_ip</h2><br>" | sudo tee /usr/share/nginx/html/index.html


echo "server {
    listen     80;


    location / {
        keepalive_timeout   0;
        root   /usr/share/nginx/html;
        index  index.html index.htm;
    }
}"  | sudo tee /etc/nginx/conf.d/custom.conf

sudo service nginx start