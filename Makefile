
FLAGS	= --env-file srcs/.env -f

VOLUME	= $${HOME}/db $${HOME}/web

all	: start.t
	docker-compose --env-file srcs/.env -f srcs/docker-compose.yml build

run	: start.t
	docker-compose --env-file srcs/.env -f srcs/docker-compose.yml up -d

stop	:
	docker stop $$(docker ps -q) || echo no conatiner to stop

clean	: stop
	docker rm $$(docker ps -qa) || echo no conatiner to rm
	docker rmi 	$$(docker images -f 'dangling=true' -q) || echo no images to rm
	rm -fr start.t
	sed -i.bak '/PASS/d' srcs/.env
	sed -i.bak '/^$$/d' srcs/.env

fclean	: clean
	docker volume rm $$(docker volume ls -q)
	sudo rm -fr ${VOLUME}
# docker rmi 	$$(docker images -q) || echo no images to rm

softre : clean all
re : fclean all

.PHONY : all run stop clean re sh_to

# ! DEBUG !
name_docker_container ?= $(shell bash -c 'read -p "$$(docker ps && echo :) " username; echo $$username')

sh_to	:
	docker exec -it ${name_docker_container} /bin/sh

# ! DEBUG !


# ! FILE DEPENDENCE !
start.t :
	(cat /etc/hosts | grep decordel) || \
	(echo "127.0.0.1 decordel.42.fr" >> /etc/hosts && \
	echo "127.0.0.1 www.decordel.42.fr" >> /etc/hosts)
	(cat srcs/.env | grep PASS) || \
	cat ./pass >> srcs/.env
	mkdir -p ${VOLUME}
	touch $@

# WP_ADMIN_PASS
# WP_PASS
# MYSQL_PASS=123ewq
# MYSQL_ROOT_PASS=123ewq
