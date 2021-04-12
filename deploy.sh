#!/bin/bash

# Create a build
# yarn build

# Createa a tar archive with the build and required files for deploy
# https://caprover.com/docs/recipe-deploy-create-react-app.html#create-the-tar-file
tar -cvf ./deploy.tar --exclude='*.map' ./captain-definition ./build/* ./Dockerfile ./package.json ./yarn.lock

# Start deploy with CapRover
caprover deploy -t ./deploy.tar