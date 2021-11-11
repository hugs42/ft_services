FROM alpine:latest

RUN apk update && apk upgrade -y
RUN apk add influxdb -y
RUN apk add ca-certificate -y

EXPOSE 8086

CMD influxd run -config /etc/influxdb.conf
