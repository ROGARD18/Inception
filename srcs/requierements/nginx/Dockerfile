FROM alpine:3.23.5

RUN apk update && apk add --no-cache nginx openssl

RUN apk install vim && apk install curl

RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/anrogard.crt \
    -keyout /etc/nginx/ssl/anrogard.key \
    -subj "/C=FR/ST=ARA/L=Lyon/O=42/CN=Antoine Rogard/UID=anrogard"

RUN mkdir -p /var/run/nginx

COPY conf/nginx.conf /etc/nginx/nginx.conf