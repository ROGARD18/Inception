FROM alpine:3.23.5

RUN apk update && apk add --no-cache nginx openssl vim curl \
    && mkdir -p /etc/nginx/ssl /var/run/nginx /var/www/wordpress \
    && chmod 755 /var /var/www /var/www/wordpress \
    && openssl req -x509 -nodes -out /etc/nginx/ssl/anrogard.crt \
       -keyout /etc/nginx/ssl/anrogard.key \
       -subj "/C=FR/ST=ARA/L=Lyon/O=42/CN=anrogard.42.fr/UID=anrogard" \
    && ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log

COPY conf/nginx.conf /etc/nginx/nginx.conf

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]