FROM debian:buster

RUN apt-get update -y && apt-get install -y nginx openssl curl vim sudo

RUN mkdir -p /etc/nginx/ssl-certificate

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
-keyout /etc/nginx/ssl-certificate/inception.key \
-out /etc/nginx/ssl-certificate/inception.crt \
-subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=vahemere.42.fr/UID=vahemere"

COPY ./conf/default.conf /etc/nginx/nginx.conf

EXPOSE 443

RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

CMD ["nginx", "-g", "daemon off;"]
