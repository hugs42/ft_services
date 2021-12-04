FROM alpine:3.14

RUN echo ">> GRAFANA <<"

RUN apk add --no-cache grafana 
RUN apk add telegraf --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community
RUN apk add nano

COPY ./srcs/grafana.db /usr/share/grafana/data/grafana.db
COPY ./srcs/run.sh /
RUN chmod +x /run.sh

EXPOSE 3000

CMD sh /run.sh
