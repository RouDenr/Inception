#! /bin/sh


wp core install --url="$DOMAIN_NAME" --title="$TITLE"\
		--admin_user="$WP_ADMIN_USER" --admin_password="$WP_ADMIN_PASS"\
		--admin_email="$WP_ADMIN_MAIL" --path="/var/www/wordpress"

wp plugin install redis-cache --activate --activate-network --path="/var/www/html"
wp redis enable --force --path="/var/www/html"

php-fpm7 -F
