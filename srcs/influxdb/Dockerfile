FROM alpine:latest
RUN echo "INFLUXDB"
RUN apk update && apk upgrade
RUN apk add --no-cache influxdb
RUN apkadd --no-cache telegraf

EXPOSE 8086

CMD influxd run -config /etc/influxdb.conf
