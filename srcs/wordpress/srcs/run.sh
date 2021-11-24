service php-fpm7 start
service mariadb start
service nginx start

wp user create bob bob@example.com --role=author
wp user create alice alice@example.com --role=author
wp user create john john@example.com --role=author
wp user create hugs hugsbord@student.42.fr --role=administrator

sleep infinity
