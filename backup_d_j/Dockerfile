# step one.
FROM maven:3-jdk-11 as builder
RUN mkdir /code
WORKDIR /code
COPY . .
RUN mvn install

## Step 2.
FROM openjdk:11-jdk
RUN mkdir /code
WORKDIR /code
EXPOSE 9090
COPY --from=builder /code/target/HelloWorld-Java-Springboot-0.0.1.jar .
EXPOSE 8080
CMD ["java","-jar","HelloWorld-Java-Springboot-0.0.1.jar"] 
