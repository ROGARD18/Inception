FROM alpine:3.23.5

RUN apk update && apk add --no-cache nginx openssl vim curl \
    && mkdir -p /etc/nginx/ssl /var/run/nginx \
    && openssl req -x509 -nodes -out /etc/nginx/ssl/anrogard.crt \
       -keyout /etc/nginx/ssl/anrogard.key \
       -subj "/C=FR/ST=ARA/L=Lyon/O=42/CN=Antoine Rogard/UID=anrogard"

COPY conf/nginx.conf /etc/nginx/nginx.conf

CMD ["nginx", "-g", "daemon off;"] 