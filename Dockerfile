FROM openjdk:11-jdk
RUN mkdir /code
WORKDIR /code
COPY ./target/HelloWorld-Java-Springboot-0.0.1.jar .
EXPOSE 8080
CMD ["java","-jar","HelloWorld-Java-Springboot-0.0.1.jar"]
