FROM alpine:3.14

RUN echo ">> PHPMYADMIN <<"

RUN apk update
RUN apk upgrade
RUN apk add --no-cache wget
RUN apk add --no-cache php7 php7-fpm php7-cli php7-mbstring php7-session php7-json php7-opcache php7-gd php7-zlib  php7-common php7-iconv php7-curl php7-xml php7-mysqli
RUN apk add --no-cache php-phar jq
RUN apk add --no-cache mariadb mariadb-common mariadb-client
RUN apk add --no-cache nginx
RUN apk add --no-cache openssl
RUN apk add --no-cache telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/
RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.1.1/phpMyAdmin-5.1.1-all-languages.tar.gz > /dev/null
RUN mkdir /etc/nginx/ssl
RUN mkdir -p /run/php7
RUN mkdir -p /run/nginx
RUN tar -xzvf phpMyAdmin-5.1.1-all-languages.tar.gz > /dev/null

RUN mv phpMyAdmin-5.1.1-all-languages phpmyadmin
RUN mv phpmyadmin /var/www/html/
RUN rm phpMyAdmin-5.1.1-all-languages.tar.gz

COPY ./srcs/nginx.conf /etc/nginx/conf.d/default.conf
COPY ./srcs/config.inc.php /var/www/html/.
COPY ./srcs/run.sh ./

EXPOSE 5000
CMD sh run.sh
