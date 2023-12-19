FROM debian:buster

RUN apt-get update -y \
    && apt-get upgrade -y \
    && apt-get install -y mariadb-server procps \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY ./conf/my.cnf /etc/mysql/
COPY ./tools/db_init.sh /

ENV DB_WP_NAME=wordpress
ENV DB_WP_USER=math123456
ENV DB_WP_PASS=pass123456
ENV DB_ROOT_PASS=rootpass123456

RUN chmod +x /db_init.sh
RUN ./db_init.sh

CMD ["mysqld_safe"]