FROM alpine:latest

RUN echo ">> NGINX <<"

RUN apk update
RUN apk upgrade
RUN apk add --no-cache nginx
RUN apk add --no-cache openssl
RUN apk add --no-cache supervisor
RUN apk add --no-cache telegraf

RUN mkdir /etc/nginx/ssl
RUN mkdir -p /var/www/html

WORKDIR /etc/nginx/ssl
RUN openssl req -x509 -newkey rsa:2048 -nodes -out /etc/nginx/ssl/nginx.crt -keyout /etc/nginx/ssl/nginx.key -subj "/C=FR/ST=FRANCE/L=Paris/O=42/OU=42/CN=localhost"

COPY ./srcs/default.conf /etc/nginx/conf.d/default.conf
COPY ./srcs/index.html /var/www/html/index.html

WORKDIR /
COPY ./srcs/run.sh /

EXPOSE 80 443

RUN mkdir -p /run/nginx
CMD service telegraf start
CMD sh run.sh
