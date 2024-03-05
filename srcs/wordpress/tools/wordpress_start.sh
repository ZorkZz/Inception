#!/bin/bash

	sed -i "s/listen = \/run\/php\/php8.2-fpm.sock/listen = 9000/" "/etc/php/8.2/fpm/pool.d/www.conf";
	chown -R www-data:www-data /var/www/*;
	chown -R 777 /var/www/*;
	mkdir -p /run/php/;
	touch /run/php/php8.2-fpm.pid;
	rm -rf /var/www/html/*


if [ ! -f /var/www/html/wp-config.php ]; then
	echo "Wordpress: setting up..."
	mkdir -p /var/www/html
	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar;
	chmod +x wp-cli.phar; 
	mv wp-cli.phar /usr/local/bin/wp;
	cd /var/www/html;
	wp core download --allow-root;
	cp /var/www/wp-config.php /var/www/html/
	# echo "Wordpress: creating users..."
	# wp core install --allow-root --url=${WP_URL} --title=${WP_TITLE} --admin_user=${WP_ADMIN_LOGIN} --admin_password=${WP_ADMIN_PASSWORD} --admin_email=${WP_ADMIN_EMAIL}
	# wp user create --allow-root ${WP_USER_LOGIN} ${WP_USER_EMAIL} --user_pass=${WP_USER_PASSWORD};
	echo "Wordpress: set up!"
fi

exec "$@"
