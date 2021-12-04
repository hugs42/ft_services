mkdir -p /run/nginx


openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -subj "/C=FR/L=Paris/O=42/CN=localhost"    \
    -keyout /etc/nginx/ssl/nginx.key   \
    -out /etc/nginx/ssl/nginx.crt

mkdir -p /etc/telegraf
telegraf -sample-config --input-filter cpu:mem:net:swap:diskio --output-filter influxdb > /etc/telegraf/telegraf.conf
sed -i s/'# urls = \["http:\/\/127.0.0.1:8086"\]'/'urls = ["http:\/\/influxdb:8086"]'/ /etc/telegraf/telegraf.conf
sed -i s/'# database = "telegraf"'/'database = "nginx"'/ /etc/telegraf/telegraf.conf
sed -i s/'omit_hostname = false'/'omit_hostname = true'/ /etc/telegraf/telegraf.conf

nginx
telegraf
/usr/sbin/nginx -g "daemon off;"
