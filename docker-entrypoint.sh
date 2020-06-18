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

# 这里使用 sh -c 运行 ./ngrok
# 直接运行 ./ngrok 时，该进程无法接收 SIGINT 信号（即：ctrl+c 中断进程）
sh -c "./ngrok -config=./ngrok.cfg -log=$LOG -subdomain=$SUBDOMAIN $PORT"
