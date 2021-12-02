FROM alpine:3.14

RUN echo ">> MYSQL <<"

RUN apk update
RUN apk upgrade
RUN apk add --no-cache mysql
RUN apk add --no-ca-cache mysql-client
RUN apk add --no-cache telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/

COPY ./srcs/run.sh /run.sh
COPY ./srcs/init.sql /init.sql
COPY ./srcs/my.cnf /etc/my.cnf
RUN chmod +x /run.sh
COPY ./srcs/telegraf.conf /etc/telegraf.conf

EXPOSE 5050

CMD sh /run.sh
