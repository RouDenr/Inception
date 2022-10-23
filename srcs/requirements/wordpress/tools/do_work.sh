#! /bin/sh


wp core install --url="$DOMAIN_NAME" --title="$TITLE"\
		--admin_user="$WP_ADMIN_USER" --admin_password="$WP_ADMIN_PASS"\
		--admin_email="$WP_ADMIN_MAIL" --path="/var/www/wordpress"
php-fpm7 -F
