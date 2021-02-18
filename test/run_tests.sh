#!/usr/bin/env bash

set -eu

readonly CAKE_VERSION="4.*"
readonly APP_DIR="/var/www/cake_app"

cd ${APP_DIR}

# create new app
composer create-project \
      --no-interaction \
      --working-dir="${APP_DIR}" \
      --prefer-dist \
      cakephp/app:"${CAKE_VERSION}" \
      .

curl -v localhost:80
curl -v localhost:80/pages/home

exit 0
