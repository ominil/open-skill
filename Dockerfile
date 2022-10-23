FROM maven:3.8.6 AS maven

WORKDIR /usr/src/app
COPY . /usr/src/app

RUN mvn clean package

FROM openjdk:17-jdk

ARG JAR_FILE=/usr/src/app/target/*.jar

COPY --from=maven ${JAR_FILE} app.jar

ENTRYPOINT [ "java", "-jar", "/app.jar" ]