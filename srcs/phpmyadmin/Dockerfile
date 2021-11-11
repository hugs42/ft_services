FROM alpine:latest

RUN apk update
RUN apk upgrade
RUN apk add wget
RUN apk add php7.4 php7.4-fpm php7.4-cli php7.4-mysql php7.4-mbstring php7.4-session php7.4-json
RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.1.1/phpMyAdmin-5.1.1-all-languages.tar.gz
RUN tar -xzvf phpMyAdmin-5.1.1-all-languages.tar.gz
RUN rm phpMyAdmin-5.1.1-all-languages.tar.gz
RUN mv phpMyAdmin-5.1.1-all-languages /var/www/html/phpmyadmin/

COPY ./srcs/config.inc.php /var/www/phpmyadmin/

EXPOSE 5000
