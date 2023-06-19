FROM debian:buster

RUN apt-get update -y && apt-get install -y mariadb-server mariadb-client procps

COPY ./conf/default.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

RUN mkdir -p /var/lib/mysql /var/run/mysqld
RUN chown mysql:mysql /var/run/mysqld/
RUN chmod -R 755 /var/run/mysqld/
RUN chown mysql:mysql /var/lib/mysql/
RUN chmod -R 755 /var/lib/mysql/

EXPOSE 3306

COPY ./bdd.sh ./
RUN chmod +x ./bdd.sh

ENTRYPOINT ["bash", "./bdd.sh"]
