FROM alpine:3.14

RUN echo ">> FTPS <<"

RUN apk add --no-cache vsftpd
RUN apk add --no-cache openssl 
RUN apk add --no-cache telegraf --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community


COPY ./srcs/vsftpd.conf /etc/vsftpd/vsftpd.conf
COPY ./srcs/run.sh /
RUN chmod +x /run.sh

EXPOSE 20 21 21000

CMD sh /run.sh