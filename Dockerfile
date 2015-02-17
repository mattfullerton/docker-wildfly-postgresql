FROM jboss/wildfly:8.2.0.Final

RUN curl -o /tmp/psql-jdbc.jar http://jdbc.postgresql.org/download/postgresql-9.3-1102.jdbc41.jar
RUN curl -o /tmp/postgis-jdbc.jar http://postgis.net/stuff/postgis-jdbc-2.1.3.jar 
ADD config.sh /tmp/
ADD batch.cli /tmp/

RUN /tmp/config.sh
RUN /opt/jboss/wildfly/bin/add-user.sh wildflyadmin INSERTPASSWORDHERE --silent

CMD ["/opt/jboss/wildfly/bin/standalone.sh", "-b", "0.0.0.0", "-bmanagement", "0.0.0.0"]
