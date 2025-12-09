
# Created by AB

FROM tomcat:jre17-temurin
WORKDIR /usr/local/tomcat/
COPY /home/runner/work/spring-petclinic/spring-petclinic/app/*.jar ./webapps
EXPOSE 8080
CMD ["catalina.sh", "run"]
