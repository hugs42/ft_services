FROM alpine:3.14

RUN echo ">> NGINX <<"

RUN apk add --no-cache nginx
RUN apk add --no-cache openssl
RUN apk add --no-cache telegraf --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community

RUN mkdir -p /var/www/html;

COPY srcs/default.conf  /etc/nginx/conf.d/default.conf
COPY srcs/index.html    /var/www/html/index.html
COPY ./srcs/run.sh /
RUN chmod +x /run.sh

EXPOSE 80 443

CMD sh /run.sh
