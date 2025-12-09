FROM eclipse-temurin:21-jdk

WORKDIR /app

COPY app/gradle gradle
COPY app/gradlew .
COPY app/build.gradle .
COPY app/settings.gradle .

RUN ./gradlew --no-daemon dependencies

COPY app/src src

RUN ./gradlew --no-daemon shadowJar

ENV JAVA_OPTS="-Xmx512M -Xms512M"
EXPOSE 7070

CMD ["java", "-jar", "build/libs/app-1.0-SNAPSHOT-all.jar"]
