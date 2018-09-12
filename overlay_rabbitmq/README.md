# 如何使用

* 创建overlay网络
* 主机启动脚本

```
sh startMaster.sh
docker-compose up -d
```

* 其他机器上启动脚本(需要先将里面的rabbit2 以及 rabbit3更换为其他的，保证唯一)
* 更换后的如下所示

```
 rabbit5:
   image: grandmore/rabbitmq-cluster
   hostname: rabbit5
   container_name: "rabbit5"
   mem_limit: 128m
   volumes:
     - ./rabbit5:/var/lib/rabbitmq
   environment:
     - ERLANG_COOKIE=abcdefg
     - CLUSTER_WITH=rabbit1
   networks:
    default:
     aliases:
      - rabbit5
   ports:
     - "5674:5672"
     - "15872:15672"
```

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

# 恢复
* rabbit1等文件夹不能删除，删除后必须得移除原来有的节点再次添加

```
rabbitmqctl rabbit@rabbit4
```



# Credits

* Inspired by https://github.com/bijukunjummen/docker-rabbitmq-cluster
