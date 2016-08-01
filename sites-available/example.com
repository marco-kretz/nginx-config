server {
    listen 80;
    listen [::]:80;
    server_name example.com www.example.com;
    return 301 https://$server_name$request_uri;
}

server {
    listen 443 ssl http2;
    listen [::]:443 ssl http2;
    server_name example.com www.example.com;

    include snippets/letsencrypt-example.com.conf;
    include snippets/ssl-params.conf;

    root /var/www/example.com;

    index index.php;

    access_log /var/log/nginx/example.com.access.log;
    error_log  /var/log/nginx/example.com.error.log;

    include snippets/restrictions.conf;

    include snippets/wordpress.conf;
}
