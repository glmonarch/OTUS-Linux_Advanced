Описание стенда:

Стенд содержит в себе 5 виртуальных машин под VirtualBox. Каждая машина (за исключением машины ansible) имеет по 2 IP адреса из разных подсетей для реализации технологии Multipath. 

Назначение ВМ:

1. iscsi [192.168.1.10/192.168.2.10] - машина, на которой создан диск /dev/sdb, который будет монтироваться на ноды кластера с помощью ПО iSCSI initiator.
2. node1 [192.168.1.11/192.168.2.11] - первая нода кластера Pacemaker.
3. node2 [192.168.1.12/192.168.2.12] - вторая нода кластера Pacemaker.
4. node3 [192.168.1.13/192.168.2.13] - третья нода кластера Pacemaker.
5. ansible [192.168.1.100] - машина, на которой будет запускаться итоговый Ansible-плейбук, включающий в себя все роли, необходимые для конфигурирования остальных виртуальных машин.

Как запустить стенд?

1. git clone https://github.com/glmonarch/OTUS-Linux_Advanced.git
2. cd OTUS-Linux_Advanced/LAB2-via-Vagrant
3. vagrant up
4. vagrant ssh ansible
5. sudo su && su - ansible && cd ~
6. ansible-playbook -K site.yml (become pasword: "password").
