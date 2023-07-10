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

RUN			mysql_install_db --datadir=/var/lib/mysql --user=mysql
RUN		service mysql start	&& \
		echo "CREATE DATABASE $SQL_DATABASE;" | mysql -u root && \

		echo "CREATE USER '$SQL_ADMIN'@'*';" | mysql -u root && \
		echo "SET password FOR '$SQL_ADMIN'@'*' = password('$SQL_ADMIN_PASSWORD');" | mysql -u root && \
		echo "CREATE USER '$SQL_USER'@'*';" | mysql -u root && \
		echo "SET password FOR '$SQL_USER'@'*' = password('$SQL_USER_PASSWORD');" | mysql -u root && \


		# echo "GRANT ALL PRIVILEGES ON $SQL_DATABASE.* TO '$SQL_ADMIN'@'*' WITH GRANT OPTION;" | mysql -u root && \
		# echo "GRANT ALL ON '$SQL_DATABASE'.* to '$SQL_ADMIN'@'*'" && \
		# echo "SELECT host FROM mysql.user WHERE user = '$SQL_ADMIN';"  | mysql -u root  && \
		# echo "CREATE USER '$SQL_ADMIN'@'%' IDENTIFIED BY '$SQL_ADMIN_PASSWORD';" | mysql -u root && \
		# echo "GRANT ALL PRIVILEGES ON *.* TO '$SQL_ADMIN'@'%';" | mysql -u root && \
		echo "FLUSH PRIVILEGES;" | mysql -u root

RUN service mysql start && \
    echo "SET password FOR 'root'@'localhost' = password('$SQL_ROOT_PASSWORD');" | mysql -u root && \
    mysql_upgrade -u root -prootpass


EXPOSE 3306

ENTRYPOINT ["mysqld"]
