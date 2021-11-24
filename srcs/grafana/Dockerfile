FROM alpine:latest

RUN echo ">> GRAFANA <<"
RUN apk update && apk upgrade
RUN apk add --no-cache wget
RUN wget https://dl.grafana.com/enterprise/release/grafana-enterprise-8.2.4.linux-amd64.tar.gz
RUN tar -zxvf grafana-enterprise-8.2.4.linux-amd64.tar.gz > /dev/null
RUN rm grafana-enterprise-8.2.4.linux-amd64.tar.gz

EXPOSE 3000
