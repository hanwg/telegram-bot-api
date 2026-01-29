#!/usr/bin/with-contenv bashio
set -e

API_ID="$(bashio::config 'api_id')"
API_HASH="$(bashio::config 'api_hash')"
LOG_LEVEL="$(bashio::config 'log_level')"

if [ -z "$API_ID" ]
then
  bashio::log.fatal "api_id is not set. Please set it in the app configuration."
  exit 1
fi

if [ -z "$API_HASH" ]
then
  bashio::log.fatal "api_hash is not set. Please set it in the app configuration."
  exit 1
fi

/usr/local/bin/telegram-bot-api --version

mkdir -p /data/telegram-bot-api
/usr/local/bin/telegram-bot-api \
  --api-id="${API_ID}" \
  --api-hash="${API_HASH}" \
  --local \
  --dir=/data/telegram-bot-api \
  --verbosity="${LOG_LEVEL}"
