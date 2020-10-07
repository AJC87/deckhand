#!/bin/bash
#
# CLI program

echo 'Welcome to Deckhand!'

# Check gcloud is installed
# TODO: is this the best way?
if [[ ! $(which gcloud) ]]; then
  echo 'gcloud not installed, please install first! Exiting...'
  exit 1
fi

# TODO: check if a project is set if not maybe allow choosing

# TODO: if project was already set display it and ask user is that what they want
# otherwise maybe allow choosing

readonly PROJECT_ID="$(gcloud config get-value project)"

echo "Project ID: ${PROJECT_ID}"

# TODO: improve this hopefully get it directly from the gcloud command
readonly PROJECT_NAME="$(gcloud projects list | grep "${PROJECT_ID}" | tr -s ' ' '\t' | cut -f 2)"

echo "Project name: ${PROJECT_NAME}"

# Check Docker is running if we don't use Cloud Build
if [[ ! $(docker info 2> /dev/null) ]]; then
  echo 'Docker not running, Exiting...'
  # exit 1
fi

if [[ ! -f 'Dockerfile' ]]; then
  echo 'Dockerfile not present'
fi
