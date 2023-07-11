FROM debian:buster

ARG SQL_DATABASE
ARG SQL_USER
ARG SQL_ADMIN
ARG SQL_USER_PASSWORD
ARG SQL_ADMIN_PASSWORD
ARG SQL_ROOT_PASSWORD
ARG SQL_HOST

RUN apt-get update -y && apt-get install -y mariadb-server

COPY ./conf/default.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

# RUN		mysql_install_db --datadir=/var/lib/mysql --user=mysql

RUN		service mysql start	&& \
    sleep 10 && \
	echo "CREATE DATABASE $SQL_DATABASE;" | mysql -u root && \
    echo "SET password FOR 'root'@'localhost' = password('$SQL_ROOT_PASSWORD');" | mysql -u root && \
    echo "CREATE USER '${SQL_USER}'@'*' IDENTIFIED BY '${SQL_USER_PASSWORD}';" | mysql -u root -p${SQL_ROOT_PASSWORD} && \
    echo "CREATE USER '${SQL_ADMIN}'@'*' IDENTIFIED BY '${SQL_ADMIN_PASSWORD}';" | mysql -u root -p${SQL_ROOT_PASSWORD} && \
    echo "GRANT ALL ON $SQL_DATABASE.* TO '$SQL_ADMIN'@'%' IDENTIFIED BY '$SQL_ADMIN_PASSWORD';" | mysql -u root -p${SQL_ROOT_PASSWORD} && \
    echo "FLUSH PRIVILEGES;"

EXPOSE 3306

CMD ["mysqld"]
