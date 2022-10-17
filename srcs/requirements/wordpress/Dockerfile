FROM	alpine:3.15

RUN     apk update --no-cache && \
        apk add php php7-fpm php7-mysqli php7-json php7-phar\
        php7-iconv php7-mbstring mariadb-client redis
        # apk add --no-cache wordpress

RUN     sed -i 's/listen = 127\.0\.0\.1:9000/listen = 9000/g' /etc/php7/php-fpm.d/www.conf

RUN mkdir -p /var/www/html

COPY conf/wp-config.php /var/www/html


RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -O /bin/wp

RUN chmod +x /bin/wp
RUN chmod -R 755 /var/www/html
RUN chown -R 1000:1000 /var/www/html
RUN rm -f /var/www/html/php-config-simple.php

RUN wp core download --path=/var/www/html/ --locale=en_US
# RUN wp core install --url="$DOMAIN_NAME" --title="$TITLE" --admin_user="$WP_ADMIN_USER" --admin_password="$WP_ADMIN_PASSWORD" --admin_email="$WP_ADMIN_MAIL" --path="/var/www/html"

EXPOSE 9000

# RUN /bin/sh
CMD [ "php-fpm7", "-F" ]
