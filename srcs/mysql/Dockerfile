FROM alpine:latest

RUN echo ">> MYSQL <<"

RUN apk update
RUN apk upgrade
RUN apk add --no-cache mariadb
RUN apk add --no-cache mariadb-common
RUN apk add --no-cache mariadb-client
RUN apk add --no-cache telegraf

COPY ./srcs/run.sh ./

EXPOSE 3306

CMD /etc/init.d/mariadb setup
CMD sh run.sh
