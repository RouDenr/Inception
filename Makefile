# V_FLAG = -v /home/decordel/Inception/srcs/resources:/usr/src/app/resources

# all :
# 	docker run --rm --name web -p 8080:8080 -e TZ=Europe/Moscow ${V_FLAG} web-hello

# build	:
# 	docker build -t web-hello srcs/



all	:
	docker-compose --env-file srcs/.env -f srcs/docker-compose.yml build

run	:
	docker-compose --env-file srcs/.env -f srcs/docker-compose.yml up -d

clean	:
# docker stop $(docker ps -aq)
# docker rm 	$(docker ps -aq)
	docker rmi 	$(docker images -f 'dangling=true' -q)
