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

* 查看集群状态

```
root@rabbit1:/# rabbitmqctl cluster_status
Cluster status of node rabbit@rabbit1 ...
[{nodes,[{disc,[rabbit@rabbit1,rabbit@rabbit2,rabbit@rabbit3]}]},
{running_nodes,[rabbit@rabbit3,rabbit@rabbit2,rabbit@rabbit1]},
{cluster_name,<<"rabbit@rabbit2">>},
{partitions,[]},
{alarms,[{rabbit@rabbit3,[]},{rabbit@rabbit2,[]},{rabbit@rabbit1,[]}]}
```

# Credits

* Inspired by https://github.com/bijukunjummen/docker-rabbitmq-cluster
