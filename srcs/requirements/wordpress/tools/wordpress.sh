#!/bin/sh

if [ ! -f "wp-config.php" ]; then
    wp core download --allow-root
    wp config create --dbname=${SQL_DATABASE} --dbuser=${SQL_USER} --dbpass=${SQL_PASSWORD} --dbhost=mariadb --allow-root
    wp core install --url=anrogard.42.fr --title="Inception" --admin_user=${SQL_USER} --admin_password=${SQL_PASSWORD} --admin_email=anrogard@student.42.fr --allow-root
fi

exec php-fpm84 -F