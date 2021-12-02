FROM alpine:3.14
RUN echo ">>FTPS<<"

RUN apk update
RUN apk upgrade
RUN apk add --no-cache vsftpd
RUN apk add --no-cache openssl
RUN apk add --no-cache telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/

RUN echo "root:toor" | chpasswd && mkdir /var/ftp

WORKDIR /etc/vsftpd/ssl
RUN adduser -D -h /var/ftp root 
RUN echo "root:toor" | chpasswd
COPY ./srcs/vsftpd.conf /etc/vsftpd/vsftp.conf
COPY ./srcs/run.sh ./

RUN chmod +x ./run.sh
EXPOSE 21
CMD sh run.sh
