FROM alpine:3.14

RUN echo ">> NGINX <<"

RUN apk update
RUN apk upgrade
RUN apk add --no-cache nginx
RUN apk add --no-cache openssl
RUN apk add --no-cache supervisor
RUN apk add --no-cache telegraf

RUN mkdir /etc/nginx/ssl
RUN mkdir -p /var/www/html

WORKDIR /

COPY ./srcs/nginx.conf /etc/nginx/.
#COPY ./srcs/default.conf /etc/nginx/conf.d/default.conf
COPY ./srcs/index.html /var/www/html/index.html

WORKDIR /
COPY ./srcs/run.sh /
RUN chmod +x /run.sh


RUN mkdir -p /run/nginx

EXPOSE 80 443
#CMD service telegraf start
CMD sh run.sh
