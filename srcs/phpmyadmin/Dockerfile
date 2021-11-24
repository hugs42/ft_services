FROM alpine:latest

RUN echo ">>PHPMYADMIN<<"

RUN apk update
RUN apk upgrade
RUN apk add --no-cache wget
RUN apk add --no-cache php7 php7-fpm php7-cli php7-mbstring php7-session php7-json
RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.1.1/phpMyAdmin-5.1.1-all-languages.tar.gz

RUN tar -xzvf phpMyAdmin-5.1.1-all-languages.tar.gz > /dev/null
RUN mkdir -p /var/www/html/phpMyAdmin
RUN mv phpMyAdmin-5.1.1-all-languages /var/www/html/phpMyAdmin
RUN rm phpMyAdmin-5.1.1-all-languages.tar.gz

COPY ./srcs/config.inc.php /var/www/html/phpMyAdmin
COPY ./srcs/run.sh ./

EXPOSE 5000
CMD sh run.sh
