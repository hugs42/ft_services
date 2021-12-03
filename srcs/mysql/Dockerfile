FROM alpine:3.14

RUN apk update
RUN apk upgrade
RUN apk add mysql
RUN apk add mysql-client
RUN apk add --no-cache telegraf --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community

COPY ./srcs/run.sh /run.sh
COPY ./srcs/init.sql /init.sql
COPY ./srcs/my.cnf /etc/my.cnf
RUN chmod +x /run.sh

CMD sh /run.sh
