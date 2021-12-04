mkdir -p /etc/telegraf
telegraf -sample-config --input-filter cpu:mem:net:swap:diskio --output-filter influxdb > /etc/telegraf/telegraf.conf
sed -i "s/wp_/${WP_DB_TABLE_PREFIX}/"          wp-config.php
sed -i "s/database_name_here/${WP_DB_NAME}/"   wp-config.php
sed -i "s/password_here/${WP_DB_PASSWD}/"      wp-config.php
sed -i "s/username_here/${WP_DB_USER}/"        wp-config.php
sed -i "s/localhost/${WP_DB_HOST}/"            wp-config.php

php-fpm7 &
nginx -g 'daemon off;'