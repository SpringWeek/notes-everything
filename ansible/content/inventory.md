## ansible inventory

### 前言

ansible inventory（清单、目录），配置主机关系，主要是针对``/etc/ansible/hosts`` 文件的配置。


### 文件格式

```
192.168.1.1
web1 ansible_ssh_port=22 ansible_ssh_host=192.168.3.90 ansible_ssh_user=root

[组名字]
192.168.1.2
192.168.1.3
192.168.3.90 ansible_ssh_user=root

[webs]
web1

```

* 如上所示用[]定义一个组名，后续可以针对一个足批量操作
* ``web1 ansible_ssh_port=22 ansible_ssh_host=192.168.3.90 ansible_ssh_user=root``本行代码针对一个主机设置了一些参数参数，更多参数，可参考[官网的说明](http://www.ansible.com.cn/docs/intro_inventory.html#behavioral-parameters)

* 可以如上先定义主机取别名，再分组，也可以直接分组；

* 验证配置

```
fangleMac:ansible fangle$ ansible webs -m ping 
web1 | SUCCESS => {
    "changed": false, 
    "ping": "pong"
}
```

