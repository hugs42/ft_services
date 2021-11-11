FROM alpine:latest
RUN echo "INFLUXDB"
RUN apk update && apk upgrade
RUN apk add influxdb
RUN apk add ca-certificate

EXPOSE 8086

CMD influxd run -config /etc/influxdb.conf
