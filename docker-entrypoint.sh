#!/bin/sh
set -ex

LOG=${LOG-${NGROK_LOG-"stdout"}}
SUBDOMAIN=${SUBDOMAIN-${NGROK_SUBDOMAIN-""}}
PORT=${PORT-${NGROK_PORT-""}}

if [ -z "$SUBDOMAIN" ]; then
  echo "Please set env.SUBDOMAIN" > /dev/stderr
  exit 1
fi

if [ -z "$PORT" ]; then
  echo "Please set env.PORT, Example: 127.0.0.1:8080 or 8081" > /dev/stderr
  exit 1
fi

./ngrok -config=./ngrok.cfg -log=$LOG -subdomain=$SUBDOMAIN $PORT
