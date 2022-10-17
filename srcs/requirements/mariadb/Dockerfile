FROM alpine:3.15

RUN     apk update --no-cache && \
        apk add mariadb mariadb-client

RUN	sed -i "7i user=mysql\ndatadir=/var/lib/mysql/" /etc/my.cnf.d/mariadb-server.cnf && \
	mariadb-install-db --user=mysql --datadir=/var/lib/mysql --auth-root-authentication-method=normal && \
	mkdir -p /run/mysqld && \
	chown -R mysql:mysql /run/mysqld

COPY ./conf/mariadb-server.cnf /etc/mysql/mariadb.conf.d/
COPY ./conf/db.sql /
RUN mysqld & \
	sleep 20 && \
	mysql < db.sql

EXPOSE	3306

CMD [ "mysqld" ]
