FROM openjdk:latest
WORKDIR /spc
COPY ./spc.jar /spc
EXPOSE 8080
ENTRYPOINT java -jar spc.jar
