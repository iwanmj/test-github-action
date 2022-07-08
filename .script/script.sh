#!/bin/bash
set -e

echo "Deployment started ..."

sudo -u $(whoami) ssh -T git@github.com
# Pull the latest version of the app
git pull git@github.com:iwanmj/test-github-action.git dev

echo "Deployment finished!"