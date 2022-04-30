#!/bin/sh
set -ex

LOG=${LOG-${NGROK_LOG-"stdout"}}
TLD=${TLD-${NGROK_TLD-"com"}}
SUBDOMAIN=${SUBDOMAIN-${NGROK_SUBDOMAIN-""}}
PORT=${PORT-${NGROK_PORT-""}}

if [ "$TLD" -ne "com" && "$TLD" -ne "cn" ]; then
  echo "Please set env.TLD=com or env.TLD=cn, default: env.TLD=com" > /dev/stderr
  exit 1
fi

if [ -z "$SUBDOMAIN" ]; then
  echo "Please set env.SUBDOMAIN" > /dev/stderr
  exit 1
fi

if [ -z "$PORT" ]; then
  echo "Please set env.PORT, Example: 127.0.0.1:8080 or 8081" > /dev/stderr
  exit 1
fi

# 这里使用 sh -c 运行 ./ding-(com|cn)
# 直接运行 ./ding-(com|cn) 时，该进程无法接收 SIGINT 信号（即：ctrl+c 中断进程）
sh -c "./ding-${TLD} -config=./ding-${TLD}.cfg -log=$LOG -subdomain=$SUBDOMAIN $PORT"
