FROM maven:3.9-eclipse-temurin-17 AS build
WORKDIR /app
COPY dojo-monolith/pom.xml .
RUN mvn dependency:go-offline -B
COPY dojo-monolith/src ./src
RUN mvn clean package -DskipTests -q

FROM eclipse-temurin:17-jre
WORKDIR /app
COPY --from=build /app/target/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-Xmx256m", "-Xms128m", "-jar", "app.jar"]
