FROM alpine:3.14

RUN echo ">> NGINX <<"

RUN apk update
RUN apk upgrade
RUN apk add --no-cache nginx
RUN apk add --no-cache openssl
RUN apk add --no-cache supervisor
RUN apk add --no-cache telegraf --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community

RUN mkdir /etc/nginx/ssl
RUN mkdir -p /var/www/html

COPY ./srcs/nginx.conf /etc/nginx/.
COPY ./srcs/index.html /var/www/html/index.html

WORKDIR /
COPY ./srcs/run.sh /
RUN chmod +x /run.sh


RUN mkdir -p /run/nginx

EXPOSE 80 443

CMD sh run.sh
