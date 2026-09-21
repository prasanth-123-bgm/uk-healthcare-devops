# Stage 1: Build the Java application
FROM maven:3.9-eclipse-temurin-17 AS build

WORKDIR /build

COPY app/pom.xml .

COPY app/src ./src

RUN mvn clean package


# Stage 2: Run the application
FROM eclipse-temurin:17-jre

WORKDIR /app

COPY --from=build /build/target/cicd-validation-1.0.0.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]