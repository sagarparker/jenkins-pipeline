#!/bin/sh

ENVIRONMENT=$1

echo "Deploying application to $ENVIRONMENT"

mkdir -p deployments/$ENVIRONMENT

cp app.py deployments/$ENVIRONMENT/app.py

echo "Deployment to $ENVIRONMENT complete"
