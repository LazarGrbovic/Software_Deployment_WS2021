# FROM debian:jessie

# RUN apt update && apt install mysql-server -y

# COPY docker-entrypoint.sh docker-entrypoint.sh
# COPY initial.sql initial.sql

# ENTRYPOINT ./docker-entrypoint.sh

# EXPOSE 3306/tcp
FROM debian:jessie
ENV MYSQL_PWD dbpw
RUN echo "mysql-server mysql-server/root_password password $MYSQL_PWD" | debconf-set-selections
RUN echo "mysql-server mysql-server/root_password_again password $MYSQL_PWD" | debconf-set-selections
RUN apt-get update && apt-get install -y mysql-server
RUN ALTER USER "root"@"localhost" IDENTIFIED WITH mysql_native_password BY "root";
RUN sed -i -e "s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/my.cnf

ADD cc-init.sh /cc-init.sh
RUN chmod 755 /cc-init.sh

EXPOSE 3306/tcp

CMD ["/cc-init.sh"]
