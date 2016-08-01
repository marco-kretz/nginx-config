# About

This is a collection of configs and snippets I use for my nginx servers.
Feel free to use, share and modify.

## Install Nginx and Prepare for Let's Encrypt

1. `$ sudo apt-get install nginx git bc`
2. `$ sudo vim /etc/nginx/sites-enabled/default`
3. Add the following lines:
    ```
    location ~ /.well-known {
        allow all;
    }
    ```
4. Save, exit and reload nginx.

## Generate SSL Cert with Let's Encrypt

1. `$ sudo git clone https://github.com/letsencrypt/letsencrypt /opt/letsencrypt`
2. `$ cd /opt/letsencrypt`
3. `$ sudo ./letsencrypt-auto certonly -a webroot --webroot-path=/usr/share/nginx/html -d example.com`

## Generate a Strong DH Group

`$ sudo openssl dhparam -out /etc/ssl/certs/dhparam.pem 2048`
