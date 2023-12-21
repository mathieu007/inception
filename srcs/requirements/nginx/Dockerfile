FROM debian:buster

RUN apt-get update && apt-get upgrade -y && apt-get -y install curl gnupg2 ca-certificates lsb-release debian-archive-keyring
RUN apt-get install -y openssl
RUN curl https://nginx.org/keys/nginx_signing.key | gpg --dearmor | tee /usr/share/keyrings/nginx-archive-keyring.gpg >/dev/null
RUN echo "deb [signed-by=/usr/share/keyrings/nginx-archive-keyring.gpg] http://nginx.org/packages/mainline/debian `lsb_release -cs` nginx" | tee /etc/apt/sources.list.d/nginx.list
RUN apt-get update && apt-get -y install nginx && rm -rf /var/lib/apt/lists/*

COPY ./conf/default.conf /etc/nginx/conf.d/default.conf
COPY ./conf/default.conf /etc/nginx/sites-available/default
COPY ./tools/exec.sh /

RUN chmod +x /exec.sh
RUN openssl req -x509 -days 365 -nodes -newkey rsa:4096 \
	-keyout /etc/ssl/private/mroy.42.fr.key \
	-out /etc/ssl/certs/mroy.42.fr.crt -sha256 -subj "/CN=mroy.42.fr"

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
# ENTRYPOINT ["/bin/bash", "-c", "/exec.sh"]
