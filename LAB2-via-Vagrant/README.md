### Описание стенда:

Стенд содержит в себе 5 виртуальных машин под VirtualBox. Каждая машина (за исключением машины ansible) имеет по 2 IP адреса из разных подсетей для реализации технологии Multipath. С помощью Ansible: 
* на машине **iscsi** настраивается iSCSI Target для блочного устройства /dev/sdb.
* на машинах **node1, node2, node3** собирается кластер Pacemaker & Corosync. Каждая нода этого кластера имеет доступ к общей файловой системе GFS2, расположенной на блочном устройстве /dev/sdb машины **iscsi** и примонтированной в каталог /mnt/gfs2 каждой ноды кластера.

### Назначение ВМ:

* **iscsi** [192.168.1.10/192.168.2.10] - машина, на которой создан диск /dev/sdb, который будет монтироваться на ноды кластера с помощью ПО iSCSI initiator.
* **node1** [192.168.1.11/192.168.2.11] - первая нода кластера Pacemaker & Corosync.
* **node2** [192.168.1.12/192.168.2.12] - вторая нода кластера Pacemaker & Corosync.
* **node3** [192.168.1.13/192.168.2.13] - третья нода кластера Pacemaker & Corosync.
* **ansible** [192.168.1.100] - машина, на которой будет запускаться итоговый Ansible-плейбук, включающий в себя все роли, необходимые для конфигурирования остальных виртуальных машин.

### Как запустить стенд?

1. git clone https://github.com/glmonarch/OTUS-Linux_Advanced.git
2. cd OTUS-Linux_Advanced/LAB2-via-Vagrant
3. vagrant up
4. vagrant ssh ansible
5. sudo su ansible
6. cd /home/ansible/ansible && ansible-playbook -K site.yml (become password: "password").
