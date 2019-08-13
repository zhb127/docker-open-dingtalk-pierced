对[钉钉内网穿透工具](https://open-doc.dingtalk.com/microapp/kn6zg7/hb7000)的容器镜像封装，以便能够使用 docker 在不同环境进行快速部署。

> 目前已将镜像上传至：[docker-hub](https://hub.docker.com/r/zhb127/open-dingtalk-pierced)。

## 使用说明

### 参数说明

| 参数 | 说明 |
| :-- | :-- |
| NGROK_SUBDOMAIN | 子域名，该子域名将会附加到 `vaiwan.com` 主域名前面。例如：使用 `zhb127-test` 作为子域名，那么，在工具启动后，请求 `zhb127-test.vaiwan.com` 即访问到被代理服务。|
| NGROK_PORT | 被代理服务的端口（HTTP 服务），例如：`8080`、`127.0.0.1:8081` 等。 |

> 注意！你所设置的 `NGROK_SUBDOMAIN` 有可能会出现被占用的情况（因为用的人越多，被占用的子域名就会越多），尽可能使用特殊一点的子域名（例如：`公司名+业务吗+环境`等格式）。

### 启动服务

```bash
docker pull zhb127/open-dingtalk-pierced

docker run -d -e NGROK_SUBDOMAIN=zhb127-test -e NGROK_PORT=127.0.0.1:8080 zhb127/open-dingtalk-pierced
```

> 启动成功后，访问 `http://zhb127-test.vaiwan.com/xxxxx` 都会被映射到内网或者本地服务 `http://127.0.0.1:8080/xxxxx`。

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
