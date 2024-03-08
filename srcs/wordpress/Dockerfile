FROM debian:bullseye

RUN apt-get update
RUN apt-get -y install php php-mysqli php-fpm wget sendmail mariadb-client && rm -rf /var/www/wordpress_start.sh

EXPOSE 9000

COPY ./conf/www.conf /etc/php/8.2/fpm/pool.d

COPY ./tools/ /var/www/


RUN chmod 777 /var/www/wordpress_start.sh

ENTRYPOINT [ "/var/www/wordpress_start.sh" ]

CMD ["/usr/sbin/php-fpm7.4", "--nodaemonize"]

