### Making Docker images using BuildPacks, we will use paketo buildpacks for java based applications

    Firstly, setting configuration for docker image in pom.xml

    then, run the following command

    mvn clean [from intelliJ lifecycle] and then,
    mvn spring-boot:build-image

### Refresh Actuator Path

    management:
      endpoints:
        web:
          exposure:
            include: "*"
    
    in the application.yml, I have set spring actuator management config, where we have /actuator/refresh endpoint.
    this is a post endpoint, so when we hit it we can see if any configuration from github repo for this loans microservice is changed
    or not.