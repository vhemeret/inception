FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y && apt-get install -y wget php7.3 php-fpm php-mysql mariadb-client

# INSTALLATION WORDPRESS AND UNTAR
RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www/html \
&& cd /var/www/html \
&& tar -xzf wordpress-6.0-fr_FR.tar.gz \
&& rm wordpress-6.0-fr_FR.tar.gz 

# GIVING RIGTH TO USER WWW-DATA FOR WRITE
RUN	chown -R www-data:www-data /var/www/html/wordpress

# INSTALLATION CLI AND GIVE PERMISSION
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
&& chmod +x wp-cli.phar \
&& mv wp-cli.phar /usr/local/bin/wp

EXPOSE 9000

COPY ./conf/wpscript.sh ./
RUN chmod +x ./wpscript.sh

COPY ./www.conf /etc/php/7.3/fpm/pool.d/www.conf

ENTRYPOINT ["bash", "./wpscript.sh"]