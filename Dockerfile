
# Created by AB

FROM tomcat:jre17-temurin
WORKDIR /usr/local/tomcat/
COPY ./app/target/*.jar ./webapps/spc.jar
EXPOSE 8080
CMD ["catalina.sh", "run"]
