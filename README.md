将[钉钉内网穿透工具](https://open-doc.dingtalk.com/microapp/kn6zg7/hb7000)封装成容器镜像，以便能够在不同的环境下使用 docker 快速部署。

## 使用说明

### 参数说明

| 参数 | 说明 |
| :-- | :-- |
| SUBDOMAIN | 附加到 `vaiwan.com` 的子域名。例如：SUBDOMAIN=zhb127，在服务启动成功后，可通过 `zhb127.vaiwan.com` 来访问被代理（穿透）的本地服务。|
| PORT | 被代理（穿透）的本地服务端口，例如：`8080`、`127.0.0.1:8081` 等。 |

注意事项：
- 由于主域名 `vaiwan.com` 唯一，因此，你所设置的 SUBDOMAIN 有可能已被他人占用了，建议：尽量使用特殊一点的 SUBDOMAIN 值（例如：`公司名+业务模块+环境`等格式的值）。

### 使用 docker 启动

启动：

```bash
docker pull zhb127/open-dingtalk-pierced

docker run -d -e SUBDOMAIN=zhb127-test -e PORT=8080 zhb127/open-dingtalk-pierced
```

> 服务启动成功后，通过外网地址 `http://zhb127-test.vaiwan.com/xxxxx` 即可访问到本地（或内网）服务 `http://0.0.0.0:8080/xxxxx`。

查看容器状态：

```bash
docker ps -f 'ancestor=zhb127/open-dingtalk-pierced'

CONTAINER ID        IMAGE                          COMMAND             CREATED             STATUS              PORTS               NAMES
ff92c3f8e834        zhb127/open-dingtalk-pierced   "/run.sh"           6 minutes ago       Up 6 minutes        4040/tcp            hungry_borg
```

查看容器日志：

```bash
docker logs -f `docker ps -q -f 'ancestor=zhb127/open-dingtalk-pierced'`
```

### 使用 docker-compose 启动

```bash
docker-compose up -d
```

查看容器状态：

```bash
docker ps -f 'ancestor=zhb127/open-dingtalk-pierced'

CONTAINER ID        IMAGE                          COMMAND             CREATED             STATUS              PORTS                    NAMES
2a90e9372323        zhb127/open-dingtalk-pierced   "/run.sh"           4 minutes ago       Up 41 seconds       0.0.0.0:4040->4040/tcp   open-dingtalk-pierced
```

查看容器日志：

```bash
docker logs -f `docker ps -q -f 'ancestor=zhb127/open-dingtalk-pierced'`
```
