


all	:
	docker-compose --env-file srcs/.env -f srcs/docker-compose.yml build

run	: start.t
	docker-compose --env-file srcs/.env -f srcs/docker-compose.yml up -d

stop	:
	docker stop $(docker ps -q)

clean	:
	docker rmi 	$(docker images -f 'dangling=true' -q)
# docker stop $(docker ps -aq)
# docker rm 	$(docker ps -aq)

.PHONY : all run stop clean

start.t :
	(cat /etc/hosts | grep decordel) || \
	(echo "127.0.0.1 decordel.42.fr" >> /etc/hosts &&\
	echo "127.0.0.1 www.decordel.42.fr" >> /etc/hosts)
	cat ./pass >> srcs/.env
	touch $@

# WP_ADMIN_PASSWORD=321qwe
# WP_PASSWORD=123ewq
