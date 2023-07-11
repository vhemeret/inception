FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y && apt-get install -y \
wget php7.3 php-fpm php-mysql mariadb-client

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
&& chmod +x wp-cli.phar \
&& mv wp-cli.phar /usr/local/bin/wp

WORKDIR /var/www/

EXPOSE 9000

COPY ./tools/wpscript.sh /usr/local/bin
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf
RUN chmod +x /usr/local/bin/wpscript.sh

ENTRYPOINT ["bash", "/usr/local/bin/wpscript.sh"]