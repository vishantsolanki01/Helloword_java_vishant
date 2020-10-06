#!/bin/bash
echo "===========image create======="
docker image build -t vishantsolanki01/javaproject:${build_id} .
