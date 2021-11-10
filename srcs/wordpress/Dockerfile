FROM alpine:latest

RUN apk update && apk upgrade -y
RUN apk add wget -y
RUN apk add php7.4 php7.4-fpm php7.4-cli php7.4-mysql php7.4-mbstring php7.4-session php7.4-json -y

RUN wget https://wordpress.org/latest.tar.gz
RUN tar -xvf latest.tar.gz
RUN rm -f latest.tar.gz
RUN mv wordpress /var/www/html/html

EXPOSE 5050
