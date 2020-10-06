#!/bin/bash

echo "============================="
echo "|| Creating Docker Image   ||"
echo "============================="

docker image build -t coolgourav147/javaproject:${BUILD_ID} -f Dockerfile-java .
