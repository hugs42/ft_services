FROM alpine:3.14

RUN echo ">> INFLUXDB <<"

RUN apk update
RUN apk upgrade
RUN apk add --no-cache influxdb
RUN apkadd --no-cache telegraf

EXPOSE 8086

COPY ./srcs/run.sh /run.sh
RUN chmod +x /run.sh
CMD influxd run -config /etc/influxdb.conf

CMD sh /run.sh
