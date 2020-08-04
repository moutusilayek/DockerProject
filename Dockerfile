FROM tomcat:9.0-alpine

ADD /target/DockerProject-0.0.1-SNAPSHOT.jar /usr/local/tomcat/webapps/

EXPOSE 1234


ENTRYPOINT ["java", "-jar","/usr/local/tomcat/webapps/DockerProject-0.0.1-SNAPSHOT.jar"]