FROM openjdk:latest

ADD target/simple-project-0.0.1-SNAPSHOT.jar simple-project-0.0.1-SNAPSHOT.jar

ENTRYPOINT ["java","-jar","simple-project-0.0.1-SNAPSHOT.jar"]

EXPOSE 8080
