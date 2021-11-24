FROM alpine:latest

RUN echo "\033[96m>> NGINX <<\033[0m"

RUN apk update
RUN apk upgrade
RUN apk add --no-cache nginx
RUN apk add --no-cache openssl

RUN mkdir /etc/nginx/ssl
WORKDIR /etc/nginx/ssl
RUN openssl req -newkey rsa:4096 -x509 -sha256 -nodes -out /etc/nginx/ssl/nginx.crt -keyout /etc/nginx/ssl/nginx.key -subj "/C=FR/L=Paris/O=42/CN=localhost"

COPY ./srcs/default.conf /etc/nginx/sites-available/default

COPY ./srcs/run.sh ./

EXPOSE 80 443

CMD sh run.sh
