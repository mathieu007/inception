FROM debian:buster

ARG DB_WP_NAME
ARG DB_WP_USER
ARG DB_WP_PASS
ARG DB_ROOT_PASS

ENV DB_WP_NAME=$DB_WP_NAME
ENV DB_WP_USER=$DB_WP_USER
ENV DB_WP_PASS=$DB_WP_PASS
ENV DB_ROOT_PASS=$DB_ROOT_PASS

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y systemd && \
    apt-get install -y mariadb-server && \
    apt-get install -y procps && \
    apt-get install -y curl && \
    apt-get clean

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
# COPY ./conf/my.cnf /etc/mysql/
COPY ./tools/db_init.sh /

RUN chmod +x /db_init.sh
RUN ./db_init.sh
RUN rm /db_init.sh

CMD ["mysqld_safe"]