#!/usr/bin/env bash

CURRENT_DIR=$(cd $(dirname $0);pwd)
ROOT_DIR=$(dirname $(dirname ${CURRENT_DIR}))
API_SCHEMA_PATH="docs/api/$1"
API_SCHEMA_DIST_PATH="schemas/api/$1"

if [ -z "$1" ]; then
  echo "Not found parameter: Usage: $0 [private|internal]"
  exit 1
fi

set -x

function combineSchema() {
  docker run -u ${UID} --rm -v ${ROOT_DIR}/${API_SCHEMA_PATH}:/tmp -v ${ROOT_DIR}/${API_SCHEMA_DIST_PATH}:/tmp_dist openapitools/openapi-generator-cli:v6.6.0 generate \
    -i /tmp/src/root.yaml \
    -g openapi-yaml \
    -o /tmp_dist \
    --additional-properties outputFile=openapi.yaml
  return $?
}

function quoteDate() {
  ruby bin/codegen/quote_date.rb ${API_SCHEMA_DIST_PATH}/openapi.yaml > /tmp/openapi.yaml
  RESULTS=$?
  if [ $RESULTS -ne 0 ]; then
    return $RESULTS
  fi
  mv /tmp/openapi.yaml ${API_SCHEMA_DIST_PATH}/openapi.yaml
  return $?
}

combineSchema && quoteDate