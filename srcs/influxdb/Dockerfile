FROM alpine:latest
RUN echo "INFLUXDB"
RUN apk update && apk upgrade
RUN apk add --no-cache influxdb

EXPOSE 8086

CMD influxd run -config /etc/influxdb.conf
