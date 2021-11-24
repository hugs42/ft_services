FROM alpine:latest

RUN echo ">>MYSQL<<"

RUN apk update && apk upgrade
RUN apk add --no-cache mariadb
RUN apk add --no-cache mariadb-common
RUN apk add --no-cache mariadb-client

COPY ./srcs/run.sh ./

EXPOSE 3306

CMD /etc/init.d/mariadb setup
CMD service mariadb start
CMD sh run.sh
