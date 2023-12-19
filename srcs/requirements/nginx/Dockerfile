FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y \
nginx \
openssl

COPY ./conf/nginx.conf /etc/nginx/sites-available/default
COPY ./conf/nginx.conf /etc/nginx/nginx.conf

RUN openssl req -x509 -days 365 -nodes -newkey rsa:4096 \
	-keyout /etc/ssl/private/nginx.key \
	-out /etc/ssl/certs/nginx.crt -sha256 -subj "/CN=mroy.42.fr"

# RUN mkdir /var/www/html/wordpress

CMD ["nginx", "-g", "daemon off;"]
