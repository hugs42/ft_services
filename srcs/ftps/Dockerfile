FROM alpine:latest
RUN echo ">>FTPS<<"

RUN apk update
RUN apk upgrade
RUN apk add vsftpd
RUN apk add openssl

RUN echo "root:toor" | chpasswd && mkdir /var/ftp

WORKDIR /etc/vsftpd/ssl
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -keyout vsftpd.key -out vsftpd.crt -subj "/C=FR/L=Paris/O=42/CN=localhost"

COPY ./srcs/vsftpd.conf /etc/vsftpd/vsftp.conf

EXPOSE 21
