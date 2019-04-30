#!/usr/bin/env bash

declare -r environment=${ENVIRONMENT:-dev}

deploy() {
  echo "Deploying to $environment"
}

deploy

