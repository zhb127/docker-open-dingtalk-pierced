将[钉钉内网穿透工具](https://open-doc.dingtalk.com/microapp/kn6zg7/hb7000)封装成容器镜像，以便能够在不同的环境下使用 docker-compose 快速部署（`官方有说明，请勿用于生产环境`）。

> 已自动更新容器镜像到 [docker hub](https://hub.docker.com/r/zhb127/open-dingtalk-pierced)。

## 使用说明

### 参数说明

| 参数 | 说明 |
| :-- | :-- |
| TLD | 顶级域名，可选：com、cn，默认：com，cn 是[此版本](https://github.com/open-dingtalk/dingtalk-pierced-client/blob/6812f273c06bd0fb1f4212bd420991a97072cf02/linux/ding.cfg)提供 |
| SUBDOMAIN | 附加到 `vaiwan.${TLD}` 的子域名。例如：SUBDOMAIN=zhb127，在服务启动成功后，可通过 `zhb127.vaiwan.${TLD}` 来访问被代理（穿透）的本地服务。|
| PORT | 被代理（穿透）的本地服务端口，例如：`8080`、`0.0.0.0:8081` 等。 |

注意事项：
- 由于主域名 `vaiwan.${TLD}` 唯一，因此，你所设置的 SUBDOMAIN 有可能已被他人占用了，建议：尽量使用特殊一点的 SUBDOMAIN 值（例如：`公司名+业务模块+环境`等格式的值）。
- 将工具封装成 docker 容器镜像后启动，从容器中访问宿主机 IP 时，MacOS、Linux 有所不同，这里我们统一借助 qoomon/docker-host 容器镜像来访问宿主机 IP。

### 启动测试

```bash
docker-compose --file ./tests/docker-compose.com.yml up --remove-orphans
```

访问 `http://localhost:4040`，进入界面管理。

访问 `http://zhb127-test.vaiwan.com`，访问本地测试服务 `echo server`。
