#Start with a base image containing Java runtime
FROM openjdk:17-jdk-slim

#Information around who maintains the image
MAINTAINER shohag

EXPOSE 8090

RUN apt-get update \
    && apt-get install -y jq

# Add the application's jar to the image
COPY target/loans-0.0.1-SNAPSHOT.jar loans-0.0.1-SNAPSHOT.jar

# execute the application
ENTRYPOINT ["java", "-jar", "loans-0.0.1-SNAPSHOT.jar"]

HEALTHCHECK --start-period=60s --interval=10s --timeout=10s --retries=3 \
    CMD curl --silent --fail --request GET http://localhost:8090/actuator/health/readiness \
        | jq --exit-status '.status == "UP"' || exit 1
