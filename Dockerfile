#
# Build stage
#
#FROM maven:3.6-jdk-8 AS build  
#COPY src /usr/src/app/src  
#COPY pom.xml /usr/src/app  
#RUN mvn -f /usr/src/app/pom.xml package

#
# Package stage
#
#FROM gcr.io/distroless/java
#COPY --from=build /usr/src/app/target/gs-actuator-service-0.1.0.jar /usr/local/lib/gs-actuator-service-0.1.0.jar
#COPY --from=build /usr/src/app/target/gs-actuator-service-0.1.0.jar /usr/app/  
#EXPOSE 9000

#ENTRYPOINT ["java","-jar","/usr/app/gs-actuator-service-0.1.0.jar"] 

FROM maven:3.6-jdk-8

RUN mkdir -p /usr/src/app

WORKDIR /usr/src/app

COPY . /usr/src/app

RUN mvn clean package

ENTRYPOINT ["java","-jar","target/gs-actuator-service-0.1.0.jar"]


#ENTRYPOINT ["/bin/sh", "-c"]
