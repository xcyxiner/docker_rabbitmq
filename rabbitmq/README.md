# 如何使用

* 创建bridge网络，具体参考 create_network.sh
* 执行如下脚本

```
docker-compose up -d
```

* 因为默认的guest只能在localhost登陆，所以需要添加新的用户
* 查看rabbit1日志输出，等rabbitmq完全启动后再执行2.sh中的操作

```
docker logs -f rabbit1 

* rabbitmq_management
* rabbitmq_web_dispatch
* rabbitmq_management_agent
completed with 3 plugins.
```

* 使用如下命令进入rabbit1容器内部

```
docker exec -it rabbit1 /bin/bash
```
