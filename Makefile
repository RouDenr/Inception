
FLAGS	= --env-file srcs/.env -f

all	: start.t
	docker-compose --env-file srcs/.env -f srcs/docker-compose.yml build

run	: start.t
	docker-compose --env-file srcs/.env -f srcs/docker-compose.yml up -d

stop	:
	docker stop $$(docker ps -q)

clean	:
	docker rmi 	$$(docker images -f 'dangling=true' -q) || echo no conatiner to rm
	rm start.t
	sed -i.bak '/PASS/d' srcs/.env
# docker stop $(docker ps -aq)
# docker rm 	$(docker ps -aq)

fclean	: clean

name_docker_container ?= $(shell bash -c 'read -p "$$(docker ps)$$(echo) " username; echo $$username')

sh_to	:
	docker exec -it ${name_docker_container} /bin/sh

.PHONY : all run stop clean

start.t :
	(cat /etc/hosts | grep decordel) || \
	(echo "127.0.0.1 decordel.42.fr" >> /etc/hosts && \
	echo "127.0.0.1 www.decordel.42.fr" >> /etc/hosts)
	(cat srcs/.env | grep PASS) || \
	cat ./pass >> srcs/.env
	touch $@

# WP_ADMIN_PASSWORD=321qwe
# WP_PASSWORD=123ewq
