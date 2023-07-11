#!/bin/sh

if [ -f /var/www/html/wordpress/wp-config.php ]

then
    echo "Wordpress is already installed."
else
	echo "Wordpress installation.."
	sleep 2

	cd /var/www/html/wordpress
	wp core download --locale=en_US --allow-root
	wp config create --allow-root --dbname=$SQL_DATABASE --dbuser=$SQL_ADMIN --dbpass=$SQL_ADMIN_PASSWORD --dbhost=$SQL_HOST
	wp core install --url=$DOMAIN_NAME --title="Inception" --admin_user=$ADMIN_USER --admin_password=$ADMIN_PASSWORD --admin_email=$ADMIN_EMAIL --skip-email --allow-root
	wp user create $USER_LOGIN $USER_MAIL --role=author --user_pass=$USER_PASS --allow-root
fi

if [ ! -d /run/php ]; then
	mkdir /run/php;
fi

# chown -R www-data:www-data /run/php/7.3/fpm
chown -R www-data:www-data /var/www/*
chmod -R 755 /var/www/*

exec /usr/sbin/php-fpm7.3 -F -R