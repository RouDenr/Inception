FROM	alpine:3.15

RUN		apk update && apk upgrade && apk add --no-cache nginx openssl

RUN mkdir /etc/nginx/ssl
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
        -out /etc/nginx/ssl/decordel.pem \
        -keyout /etc/nginx/ssl/decordel.key \
        -subj "/C=RU/ST=Kazan/L=Kazan/O=42/OU=RU/CN=decordel.42.fr"


COPY ./conf/ /conf/
# COPY /var/www/html/ /var/www/html/

RUN adduser -D -g 'www' www &&  echo 1 &&\
	mkdir -p /run/nginx &&  echo 2 && \
	mv /conf/nginx.conf /etc/nginx/nginx.conf && echo 3

EXPOSE 443

ENTRYPOINT ["nginx", "-g", "daemon off;"]
