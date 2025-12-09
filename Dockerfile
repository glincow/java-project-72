FROM eclipse-temurin:21-jdk

WORKDIR /app

COPY app/ .

RUN rm -rf build .gradle
RUN ./gradlew clean shadowJar --no-daemon --no-build-cache

# Verify PostgreSQL driver is in the JAR
RUN jar tf build/libs/app-1.0-SNAPSHOT-all.jar | grep "org/postgresql/Driver.class" || (echo "Driver not found!" && exit 1)

ENV JAVA_OPTS="-Xmx512M -Xms512M"
EXPOSE 7070

CMD ["java", "-jar", "build/libs/app-1.0-SNAPSHOT-all.jar"]
