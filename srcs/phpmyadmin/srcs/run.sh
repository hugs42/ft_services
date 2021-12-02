openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -subj "/C=FR/ST=75/L=Paris/O=42/CN=localhost"    \
    -keyout /etc/nginx/ssl/nginx.key   \
    -out /etc/nginx/ssl/nginx.crt

/usr/sbin/php-fpm7
nginx
/etc/init.d/mariadb setup
/usr/sbin/nginx -g "daemon off;"
php -S 0.0.0.0:5000 -t /var/www/html/
sleep infinity
