FROM jboss/wildfly:8.2.0.Final

RUN curl -o /tmp/psql-jdbc.jar https://jdbc.postgresql.org/download/postgresql-9.4-1200.jdbc41.jar
RUN curl -o /tmp/postgis-jdbc.jar http://postgis.net/stuff/postgis-jdbc-2.1.3.jar 
ADD config.sh /tmp/
ADD batch.cli /tmp/

RUN /tmp/config.sh
RUN /opt/jboss/wildfly/bin/add-user.sh admin INSERTPASSWORD --silent

CMD ["/opt/jboss/wildfly/bin/standalone.sh", "-b", "0.0.0.0", "-bmanagement", "0.0.0.0"]
