FROM openjdk:8-jdk-alpine

RUN apk update && \
	apk add bash

WORKDIR /usr/share/plotpad-service

COPY src/ ./src
COPY ./gradlew .
COPY gradle/ ./gradle
COPY build.gradle .
COPY settings.gradle .

RUN ./gradlew installDist

RUN ls -la build/install/plotpad/bin/plotpad
