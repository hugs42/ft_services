telegraf -config /etc/telegraf.conf &
php-fpm7 &
nginx -g 'daemon off;'
