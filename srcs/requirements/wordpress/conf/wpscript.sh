cd /var/www/html/wordpress

set -x

if ! wp core is-installed; then
wp config create	--allow-root --dbname=${SQL_DATABASE} \
			--dbuser=${SQL_ADMIN} \
			--dbpass=${SQL_ADMIN_PASSWORD} \
			--dbhost=${SQL_HOST} \
			--url=https://${DOMAIN_NAME};

wp core install	--allow-root \
			--url=https://${DOMAIN_NAME} \
			--title=${SITE_TITLE} \
			--admin_user=${ADMIN_USER} \
			--admin_password=${ADMIN_PASSWORD} \
			--admin_email=${ADMIN_EMAIL};

wp user create		--allow-root \
			${USER_LOGIN} ${USER_MAIL} \
			--role=author \
			--user_pass=${USER_PASS} ;

wp cache flush --allow-root

wp plugin install contact-form-7 --activate
wp language core install en_US --activate
wp theme delete twentynineteen twentytwenty
wp plugin delete hello
wp rewrite structure '/%postname%/'

fi

if [ ! -d /run/php ]; then
	mkdir /run/php;
fi

exec /usr/sbin/php-fpm7.3 -F -R
