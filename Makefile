V_FLAG = -v /home/decordel/Inception/srcs/requirements/tools/resources/:/usr/src/app/resources

all :
	docker run --rm --name web -p 8080:8080 -e TZ=Europe/Moscow ${V_FLAG} web-hello

build	:
	docker build -t web-hello srcs/requirements/tools

clean	:
	docker rm $(docker ps -aq)

