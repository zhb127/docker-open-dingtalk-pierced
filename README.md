对[钉钉内网穿透工具](https://open-doc.dingtalk.com/microapp/debug/ucof2g)的 docker 镜像封装，以便能快速的使用 docker 在不同环境进行部署。

> 目前已将 docker 镜像上传到 `dockerhub zhb127/open-dingtalk-pierced`。

## 使用说明

### 使用 docker 启动服务

```bash
docker run -d -e NGROK_SUBDOMAIN=zhb127-local-test -e NGROK_PORT=127.0.0.1:8081 zhb127/open-dingtalk-pierced
```

查看容器：

```bash
docker ps -f 'ancestor=zhb127/open-dingtalk-pierced'

CONTAINER ID        IMAGE                          COMMAND             CREATED             STATUS              PORTS               NAMES
ff92c3f8e834        zhb127/open-dingtalk-pierced   "/run.sh"           6 minutes ago       Up 6 minutes        4040/tcp            hungry_borg
```

查看日志：

```bash
docker logs -f `docker ps -q -f 'ancestor=zhb127/open-dingtalk-pierced'`
```

### 使用 docker-compose.yml 启动服务

```bash
docker-compose up -d
```

查看容器：

```bash
docker ps -f 'ancestor=zhb127/open-dingtalk-pierced'

CONTAINER ID        IMAGE                          COMMAND             CREATED             STATUS              PORTS                    NAMES
2a90e9372323        zhb127/open-dingtalk-pierced   "/run.sh"           4 minutes ago       Up 41 seconds       0.0.0.0:4040->4040/tcp   open-dingtalk-pierced
```

查看日志：

```bash
docker logs -f `docker ps -q -f 'ancestor=zhb127/open-dingtalk-pierced'`
```