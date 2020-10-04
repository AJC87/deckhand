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

# TODO: need to get project name using project id, doesn't seem the above command
# can give you the name
# readonly PROJECT_NAME="$()"
#
# echo "Project name: ${PROJECT_NAME}"
