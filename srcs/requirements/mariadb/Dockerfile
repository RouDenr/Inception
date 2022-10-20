FROM alpine:3.15

ARG TITLE
ARG MYSQL_DB_NAME
ARG MYSQL_USER
ARG MYSQL_PASS
ARG MYSQL_ROOT_PASS

RUN     apk update --no-cache && \
        apk add mariadb mariadb-client

RUN	sed -i "7i user=mysql\ndatadir=/var/lib/mysql/" /etc/my.cnf.d/mariadb-server.cnf && \
	mariadb-install-db --user=mysql --datadir=/var/lib/mysql --auth-root-authentication-method=normal && \
	mkdir -p /run/mysqld && \
	chown -R mysql:mysql /run/mysqld
# COPY ./conf/mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf

# COPY ./conf/db.sql /


RUN echo "[mysqld]" > /etc/my.cnf.d/mariadb-server.cnf && \
	echo "user = mysql" >> /etc/my.cnf.d/mariadb-server.cnf && \
	echo "datadir = /var/lib/mysql/" >> /etc/my.cnf.d/mariadb-server.cnf && \
	echo "port = 3306" >> /etc/my.cnf.d/mariadb-server.cnf && \
	echo "bind-address = 0.0.0.0" >> /etc/my.cnf.d/mariadb-server.cnf && \
	echo "skip-networking = false" >> /etc/my.cnf.d/mariadb-server.cnf

# RUN \
RUN mysqld & \
	sleep 20 && \
	echo "CREATE DATABASE $MYSQL_DB_NAME;" | mysql &&\
	echo "CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASS';" | mysql &&\
	echo "CREATE USER 'user'@'%' IDENTIFIED BY '$MYSQL_PASS';" | mysql &&\
	echo "GRANT ALL PRIVILEGES ON $MYSQL_DB_NAME.* TO '$MYSQL_USER'@'%';" | mysql &&\
	echo "FLUSH PRIVILEGES;" | mysql &&\
	echo "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('$MYSQL_ROOT_PASSWORD');" | mysql

EXPOSE	3306

CMD [ "mysqld" ]
