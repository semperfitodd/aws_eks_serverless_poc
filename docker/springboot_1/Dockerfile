# Use the official OpenJDK image as the base image
FROM openjdk:11-jre-slim

# Set the working directory
WORKDIR /app

# Copy the JAR file
COPY target/*.jar app.jar

# Copy the application.properties file
COPY src/main/resources/application.properties application.properties

# Set the Spring Boot configuration location
ENV SPRING_CONFIG_LOCATION=/app/application.properties

# Expose the port the application runs on
EXPOSE 8080

# Run the application
CMD ["java", "-jar", "/app/app.jar"]
