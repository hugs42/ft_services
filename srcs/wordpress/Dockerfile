FROM alpine:3.14

RUN apk update
RUN apk upgrade
RUN apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session
RUN apk add wget
RUN apk add nginx
RUN apk add telegraf 

RUN adduser -D -g 'www' www

RUN mkdir /www
RUN mkdir /www/wp
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www
RUN mkdir -p /run/nginx

COPY ./srcs/wordpress-5.8.2-fr_FR.tar.gz /

RUN tar xvf wordpress-5.8.2-fr_FR.tar.gz
RUN mv wordpress/* /www

COPY ./srcs/nginx.conf /etc/nginx/nginx.conf
COPY ./srcs/config.php /www/wp-config.php
COPY ./srcs/telegraf.conf /etc/telegraf.conf

COPY ./srcs/run.sh ./run.sh
RUN chmod +x ./run.sh
CMD sh ./run.sh
EXPOSE 5050
