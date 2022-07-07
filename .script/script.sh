#!/bin/bash
set -e

echo "Deployment started ..."

# Pull the latest version of the app
git pull origin production

echo "Deployment finished!"