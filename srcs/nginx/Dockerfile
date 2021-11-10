FROM alpine:latest

RUN apk update && apk upgrade -y
RUN apk add --no-cache nginx -y
RUN apk add --no-cache openssl -y
RUN mkdir /etx/nginx/ssl
RUN openssl req -newkey rsa:4096 -x509 -sha256 -nodes -out /etc/nginx/ssl/localhost.pem -keyout /etc/nginx/ssl/localhost.key -subj "/C=FR/ST=Paris/L=Paris/0=42 School/OU=hugsbord/CN=localhost"
COPY ./srcs/default.conf /etc/nginx/sites-available/default

