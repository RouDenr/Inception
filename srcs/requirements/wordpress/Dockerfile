FROM	alpine:3.15

RUN     apk update --no-cache && \
        apk add php php7-fpm php7-mysqli php7-json php7-phar\
        php7-iconv php7-mbstring mariadb-client redis

COPY conf/wp-config.php /var/www/wordpress/
COPY tools/do_work.sh /
RUN chmod +x /do_work.sh

RUN     sed -i 's/listen = 127\.0\.0\.1:9000/listen = 9000/g' /etc/php7/php-fpm.d/www.conf

ADD https://ru.wordpress.org/wordpress-5.7.2-ru_RU.tar.gz /var/www/
RUN cd /var/www && tar -xzvf wordpress-5.7.2-ru_RU.tar.gz
RUN	rm -f /var/www/wordpress-5.7.2-ru_RU.tar.gz
RUN	rm -f /var/www/wordpress/wp-config-sample.php
RUN mkdir ./run/php/

EXPOSE 9000

# RUN /bin/sh
CMD [ "/do_work.sh" ]
