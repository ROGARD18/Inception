FROM alpine:3.23.5

RUN apk update && apk add --no-cache php84 php84-fpm php84-mysqli php84-phar php84-iconv php84-curl php84-mbstring php84-ctype php84-session mariadb-client curl \
    && sed -i 's/memory_limit = 128M/memory_limit = 512M/g' /etc/php84/php.ini \
    && addgroup -g 82 -S www-data 2>/dev/null || true \
    && adduser -u 82 -D -S -G www-data www-data 2>/dev/null || true \
    && mkdir -p /var/log/php84 /var/www/wordpress \
    && curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

COPY conf/www.conf /etc/php84/php-fpm.d/www.conf
COPY tools/wordpress.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/wordpress.sh

WORKDIR /var/www/wordpress

EXPOSE 9000

ENTRYPOINT ["wordpress.sh"]