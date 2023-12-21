FROM debian:buster

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y systemd && \
    apt-get install -y mariadb-server && \
    apt-get install -y procps && \
    apt-get clean

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY ./conf/my.cnf /etc/mysql/
COPY ./tools/db_init.sh /
COPY ./.env /
COPY ./tools/exec.sh /

RUN chmod +x /exec.sh
RUN chmod +x /db_init.sh
RUN ./db_init.sh
RUN rm /.env
RUN rm /db_init.sh

ENTRYPOINT ["/bin/bash", "-c", "/exec.sh"]