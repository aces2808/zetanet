# syntax=docker/dockerfile:experimental
FROM amazoncorretto:8 as build
WORKDIR /workspace/app

COPY mvnw .
COPY .mvn .mvn
COPY pom.xml .
COPY zetanet-user-api/src src

RUN --mount=type=cache,target=/root/.m2 ./mvnw install -DskipTests
#RUN mkdir -p target/dependency && (cd target/dependency; jar -xf ../*.jar)
#
#FROM amazoncorretto:8
#RUN addgroup -S demo && adduser -S demo -G demo
#VOLUME /tmp
#USER demo
#ARG DEPENDENCY=/workspace/app/target/dependency
#COPY --from=build ${DEPENDENCY}/BOOT-INF/lib /app/lib
#COPY --from=build ${DEPENDENCY}/META-INF /app/META-INF
#COPY --from=build ${DEPENDENCY}/BOOT-INF/classes /app
#ENTRYPOINT ["java","-noverify","-XX:TieredStopAtLevel=1","-cp","app:app/lib/*","-Dspring.main.lazy-initialization=true","com.zetanet.app.UserMainApp"]
