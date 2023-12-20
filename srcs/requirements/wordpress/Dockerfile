FROM debian:buster

EXPOSE 9000

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y wget lsb-release ca-certificates apt-transport-https software-properties-common gnupg2
# RUN apt-get install -y gnupg2 ca-certificates apt-transport-https software-properties-common
RUN echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/sury-php.list
# RUN wget -qO - https://packages.sury.org/php/apt.gpg | sudo apt-key add -
RUN wget -qO - https://packages.sury.org/php/apt.gpg | apt-key add -
# RUN echo "deb https://packages.sury.org/php/ buster main" | sudo tee /etc/apt/sources.list.d/php.list
RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y php8.1
RUN apt-get install -y php8.1-mysql php8.1-cli php8.1-common php8.1-imap php8.1-ldap php8.1-xml php8.1-fpm php8.1-curl php8.1-mbstring php8.1-zip php8.1-gd
RUN apt-get install -y \
	mariadb-client \
	curl
	# rm -rf /var/lib/apt/lists/*

COPY ./conf/www.conf /etc/php/8.1/fpm/pool.d

ADD https://wordpress.org/latest.tar.gz /var/www/latest.tar.gz

RUN cd /var/www && tar -xvf latest.tar.gz && \
	rm -rf latest.tar.gz

RUN curl https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar --output /usr/bin/wp --silent

RUN chmod +x ./usr/bin/wp
RUN chmod 755 /var/www/wordpress
RUN chown -R www-data:www-data /var/www/wordpress

COPY ./tools/install.sh /var/www/wordpress/install.sh
COPY ./tools/wp-config.php /var/www/wordpress/wp-config.php
COPY ./.env /
COPY ./tools/exec.sh /

RUN chmod +x /exec.sh
RUN chmod +x /var/www/wordpress/wp-config.php
RUN chmod +x /var/www/wordpress/install.sh

RUN bash -c /var/www/wordpress/install.sh
RUN rm /var/www/wordpress/install.sh
RUN rm /.env

WORKDIR /
ENTRYPOINT ["/bin/bash", "-c", "/exec.sh"]