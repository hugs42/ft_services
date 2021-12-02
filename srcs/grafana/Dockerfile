FROM alpine:3.14

RUN echo ">> GRAFANA <<"

RUN apk update
RUN apk upgrade
RUN apk add --no-cache grafana --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/
RUN apk add --no-cache telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/

RUN mkdir -p /etc/telegraf

COPY	./telegraf.conf etc/telegraf/telegraf.conf
COPY	./grafana_setup.sh ./grafana_setup.sh
COPY	./grafana.db ./usr/share/grafana/data/grafana.db

EXPOSE 3000

CMD [ "bin/sh", "grafana_setup.sh" ]
