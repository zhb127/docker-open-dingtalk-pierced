#!/bin/sh
set -e
set -x

NGROK_LOG=${NGROK_LOG:-"stdout"}

if [ -z "$NGROK_SUBDOMAIN" ]; then
  echo "Please set NGROK_SUBDOMAIN"
  exit 1
fi

if [ -z "$NGROK_PORT" ]; then
  echo "Please set NGROK_PORT, example: 0.0.0.0:80"
  exit 1
fi

/ngrok -config=/ngrok.cfg -log=$NGROK_LOG -subdomain=$NGROK_SUBDOMAIN $NGROK_PORT
