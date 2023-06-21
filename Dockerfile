FROM postgres:latest
ENV POSTGRES_PASSWORD=keypass
ENV POSTGRES_DB=database
COPY init_script/init.sql /docker-entrypoint-initdb.d/init.sql