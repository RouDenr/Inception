FROM	alpine:3.15

ARG MYSQL_DB_NAME
ARG MYSQL_USER
ARG MYSQL_PASS
ARG DB_HOST
RUN     apk update --no-cache && \
        apk add php php7-fpm php7-mysqli php7-json php7-phar\
        php7-iconv php7-mbstring mariadb-client redis

COPY conf/wp-config.php /var/www/wordpress/
COPY tools/do_work.sh /
RUN chmod +x /do_work.sh

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -O /bin/wp
RUN chmod +x /bin/wp
RUN chmod -R 755 /var/www/wordpress
RUN chown -R 1000:1000 /var/www/wordpress

RUN     sed -i 's/listen = 127\.0\.0\.1:9000/listen = 9000/g' /etc/php7/php-fpm.d/www.conf

ADD https://ru.wordpress.org/wordpress-5.7.2-ru_RU.tar.gz /var/www/
RUN cd /var/www && tar -xzvf wordpress-5.7.2-ru_RU.tar.gz
RUN	rm -f /var/www/wordpress-5.7.2-ru_RU.tar.gz
RUN	rm -f /var/www/wordpress/wp-config-sample.php
RUN mkdir ./run/php/

EXPOSE 9000

RUN     sed -i "s/MYSQL_DB_NAME/$MYSQL_DB_NAME/" /var/www/wordpress/wp-config.php && \
        sed -i "s/MYSQL_USER/$MYSQL_USER/" /var/www/wordpress/wp-config.php && \
        sed -i "s/MYSQL_PASS/$MYSQL_PASS/" /var/www/wordpress/wp-config.php && \
        sed -i "s/MYSQLDB_HOST/$DB_HOST/" /var/www/wordpress/wp-config.php

# RUN /bin/sh
CMD [ "/do_work.sh" ]
