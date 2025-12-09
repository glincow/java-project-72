FROM eclipse-temurin:21-jdk

WORKDIR /app

COPY app/ .

RUN ./gradlew clean shadowJar --no-daemon

ENV JAVA_OPTS="-Xmx512M -Xms512M"
EXPOSE 7070

CMD ["java", "-jar", "build/libs/app-1.0-SNAPSHOT-all.jar"]
