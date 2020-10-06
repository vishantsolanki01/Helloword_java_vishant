#!/bin/bash

echo "============================="
echo "|| Creating Docker Image   ||"
echo "============================="

docker image build -t vishantsolanki01/javaproject:${BUILD_ID} .
