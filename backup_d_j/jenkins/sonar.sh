#!/bin/bash
echo "=============================="
echo "||       SonarQube           ||"
echo "=============================="
docker container run --rm -v $(pwd):/app -w /app maven:3-jdk-11 mvn sonar:sonar  -Dsonar.projectKey=Helloworldjavaproject -Dsonar.host.url=http://52.152.147.54:9000 -Dsonar.login=5b700af100d79e6184b0570f80685dd5ea290376
