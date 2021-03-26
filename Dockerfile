FROM openjdk:latest
WORKDIR /spc
COPY ./spring-petclinic-2.3.1.BUILD-SNAPSHOT.jar /spc
EXPOSE 8080
ENTRYPOINT java -jar spring-petclinic-2.3.1.BUILD-SNAPSHOT.jar
