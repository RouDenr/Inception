#! /bin/sh

if [ ! -f "/var/www/wordpress/.installed" ]
then
	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -O /bin/wp
	chmod +x /bin/wp

	chmod -R 755 /var/www/wordpress
	chown -R 1000:1000 /var/www/wordpress

	wp core install --url="$DOMAIN_NAME" --title="$TITLE" --admin_user="$WP_ADMIN_USER" --admin_password="$WP_ADMIN_PASS" --admin_email="$WP_ADMIN_MAIL" --path="/var/www/wordpress"
	touch /var/www/wordpress/.installed
fi

php-fpm7 -F
