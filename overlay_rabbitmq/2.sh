#查看集群状态
rabbitmqctl cluster_status
#列出当前用户列表
rabbitmqctl list_users
#添加新用户并设置为管理员权限
rabbitmqctl add_user hello kitty
rabbitmqctl set_user_tags hello administrator
