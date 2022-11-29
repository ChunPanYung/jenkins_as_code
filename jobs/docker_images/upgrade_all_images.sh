#!/usr/bin/env bash

# Get all docker images, except tags <none> or local
images=$(docker images --format "{{.Repository}}:{{.Tag}}" |
         grep --invert-match --extended-regexp '<none>|local')

# Go through each one and pull the latest one
for image in $images
do
  docker pull $image
done
