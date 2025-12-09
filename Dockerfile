
# Created by AB

FROM tomcat:jre17-temurin As deployer
WORKDIR /usr/local/tomcat/
COPY app/*.jar ./webapps
EXPOSE 8080
CMD ["catalina.sh", "run"]
