FROM alpine:3.14

RUN apk add --no-cache influxdb 
RUN apk add --no-cache telegraf --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community

COPY ./srcs/run.sh /
RUN chmod +x /run.sh

EXPOSE 8086 8088

CMD sh /run.sh
