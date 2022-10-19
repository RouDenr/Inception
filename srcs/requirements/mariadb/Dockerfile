FROM alpine:3.15

ARG TITLE
ARG MYSQL_DB_NAME
ARG MYSQL_USER
ARG MYSQL_PASS
ARG MYSQL_ROOT_PASS

RUN     apk update --no-cache && \
        apk add mariadb mariadb-client

COPY ./conf/mariadb-server.cnf /etc/mysql/mariadb.conf.d/
RUN	sed -i "7i user=mysql\ndatadir=/var/lib/mysql/" /etc/my.cnf.d/mariadb-server.cnf && \
	mariadb-install-db --user=mysql --datadir=/var/lib/mysql --auth-root-authentication-method=normal && \
	mkdir -p /run/mysqld && \
	chown -R mysql:mysql /run/mysqld

COPY ./conf/db.sql /
# RUN \
RUN mysqld & \
	sleep 20 && \
	echo "CREATE DATABASE $MYSQL_DB_NAME;" | mysql && echo 2 &&\
	echo "CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASS';" | mysql && echo 3 &&\
	echo "CREATE USER 'user'@'%' IDENTIFIED BY '$MYSQL_PASS';" | mysql && echo 3 &&\
	echo "GRANT ALL PRIVILEGES ON $MYSQL_DB_NAME.* TO '$MYSQL_USER'@'%';" | mysql && echo 4 &&\
	echo "FLUSH PRIVILEGES;" | mysql && echo 5 &&\
	echo "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('$MYSQL_ROOT_PASSWORD');" | mysql && echo 6

EXPOSE	3306

CMD [ "mysqld" ]
