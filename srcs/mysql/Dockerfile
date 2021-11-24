FROM alpine:latest

RUN echo "\033[96m>> MYSQL <<\033[0m"

RUN apk update && apk upgrade
RUN apk add --no-cache mariadb
RUN apk add --no-cache mariadb-common
RUN apk add --no-cache mariadb-client

COPY ./srcs/run.sh ./

EXPOSE 3306

CMD /etc/init.d/mariadb setup
CMD sh run.sh
