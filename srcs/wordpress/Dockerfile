FROM alpine:latest
RUN echo ">>WORDPRESS<<"

RUN apk update && apk upgrade
RUN apk add wget
RUN apk add php7 php7-fpm php7-cli php7-mbstring php7-session php7-json

RUN wget https://wordpress.org/latest.tar.gz
RUN tar -xzvf latest.tar.gz
RUN mkdir -p /var/www/html
RUN mv wordpress /var/www/html
RUN rm -f latest.tar.gz

COPY ./srcs/wp-config.php /var/www/html/wordpress

EXPOSE 5050
