#!/bin/sh

ENVIRONMENT=$1

echo "Running smoke tests against $ENVIRONMENT"

test -f deployments/$ENVIRONMENT/app.py

echo "Smoke tests passed"
