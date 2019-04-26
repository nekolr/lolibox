FROM maven:3.6.1-jdk-8-alpine AS build

RUN mkdir -p /usr/src/app

WORKDIR /usr/src/app

COPY . .

RUN mvn clean package


FROM openjdk:8-jdk-alpine

COPY --from=build /usr/src/app/lolibox-server/target/lolibox-server-0.2.7-RELEASE.jar .

CMD ["java", "-jar", "lolibox-server-0.2.7-RELEASE.jar"]