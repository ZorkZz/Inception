#!/bin/bash

	sed -i "s/listen = \/run\/php\/php7.4-fpm.sock/listen = 9000/" "/etc/php/7.4/fpm/pool.d/www.conf";
	chown -R www-data:www-data /var/www/*;
	chown -R 777 /var/www/*;
	mkdir -p /run/php/;
	touch /run/php/php7.4-fpm.pid;


	echo "Wordpress: setting up..."
	mkdir -p /var/www/html
	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar;
	chmod +x wp-cli.phar; 
	mv wp-cli.phar /usr/local/bin/wp;
	cd /var/www/html;
	wp core download --allow-root;
	echo "Wordpress: creating users..."
	
	wp config create --allow-root --dbname=wordpress --dbuser=astachni --dbpass=67 --dbhost=mariadb --locale=fr_FR
	
	wp core install --allow-root --url=astachni.42.fr --title=${WP_TITLE} --admin_user=${WP_ADMIN_LOGIN} --admin_password=${WP_ADMIN_PASSWORD} --admin_email=${WP_ADMIN_EMAIL}
	

	wp user create --allow-root ${WP_USER_LOGIN} ${WP_USER_EMAIL} --user_pass=${WP_USER_PASSWORD};
	chown -R www-data:www-data /var/www/*;

	echo "Wordpress: set up!"

exec "$@"