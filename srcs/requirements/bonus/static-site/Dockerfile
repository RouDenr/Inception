FROM alpine:3.15

RUN apk update && apk upgrade && apk add --no-cache nginx

RUN echo "server {" > /etc/nginx/http.d/default.conf && \
    echo "root    /var/www/;" >> /etc/nginx/http.d/default.conf && \
    echo "index index.html;" >> /etc/nginx/http.d/default.conf && \
    echo "}" >> /etc/nginx/http.d/default.conf
    # echo "location / {" >> /etc/nginx/http.d/default.conf && \
    # echo "    try_files \$uri /index.html;" >> /etc/nginx/http.d/default.conf && \
    # echo "}}" >> /etc/nginx/http.d/default.conf

COPY ./tools/index.html /var/www/
RUN cat /etc/nginx/http.d/default.conf
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
