FROM alpine:3.14

RUN apk update
RUN apk upgrade
RUN apk add mysql
RUN apk add mysql-client
RUN apk add telegraf 

COPY ./srcs/run.sh /run.sh
COPY ./srcs/init.sql /init.sql
COPY ./srcs/my.cnf /etc/my.cnf
RUN chmod +x /run.sh
COPY ./srcs/telegraf.conf /etc/telegraf.conf

CMD sh /run.sh
