#!/bin/bash
echo "=============================="
echo "||       Building           ||"
echo "=============================="
docker container run --rm -v $(pwd):/app -w /app maven:3-jdk-11 mvn -B -DskipTests clean package
