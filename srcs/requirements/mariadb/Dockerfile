FROM debian:bullseye

RUN apt-get update
RUN apt-get install -y mariadb-server

EXPOSE 3306

COPY ./conf/mysqld.conf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./tools /var/www/

RUN chmod +x /var/www/mariadb.sh

RUN /var/www/mariadb.sh && mysql < /var/www/wordpress.sql && rm -f /var/www/wordpress.sql;

CMD ["mysqld", "--bind-address=0.0.0.0"]