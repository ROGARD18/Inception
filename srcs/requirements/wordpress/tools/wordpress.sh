#!/bin/sh

WP_ADMIN_PASSWORD=$(cat /run/secrets/credentials)
DB_PASSWORD=$(cat /run/secrets/db_password)

while ! mariadb -h mariadb -u${SQL_USER} -p${DB_PASSWORD} ${SQL_DATABASE} &>/dev/null; do
    sleep 2
done

if [ ! -f "wp-config.php" ]; then
    wp core download --allow-root
    wp config create --dbname="${SQL_DATABASE}" --dbuser="${SQL_USER}" --dbpass="${DB_PASSWORD}" --dbhost=mariadb --allow-root
fi

if ! wp core is-installed --allow-root; then
    wp core install --url="https://${DOMAIN_NAME}" --title="Inception" --admin_user="${WP_ADMIN_USER}" --admin_password="${WP_ADMIN_PASSWORD}" --admin_email="${WP_ADMIN_EMAIL}" --allow-root
    wp user create "${WP_USER}" "${WP_USER_EMAIL}" --role=author --user_pass="${WP_ADMIN_PASSWORD}" --allow-root
    chown -R www-data:www-data /var/www/wordpress
fi

exec /usr/sbin/php-fpm84 -F -O