FROM alpine:latest

RUN apk update
RUN apk upgrade
RUN apk add vsftpd
RUN apk add openssl

RUN echo "root:toor" | chpasswd && mkdir /vart/ftp

RUN m
WORKDIR /etc/vsftpd/ssl
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -keyout vsftpd.key -out vsftpd.pem -subj "/C=FR/L=Paris/O=42/CN=localhost"
RUN chmod 400 ftp.key && chmod 444 ftp.crt
COPY ./srcs/vsftpd.conf /etc/vsftpd/vsftp.conf

EXPOSE 21
