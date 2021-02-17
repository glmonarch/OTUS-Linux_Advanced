### Как запустить стенд?

1. git clone https://github.com/glmonarch/OTUS_Linux_Advanced.git
2. cd OTUS_Linux_Advanced/LAB1
3. Добавить свой API-токен Advanced Hosting в переменную "ah_token" в файле terraform.tfvars
4. Добавить свой private ssh key в панели Advanced Hosting.
5. Скопировать Fingerprint SSH-ключа из панели Advanced Hosting и вставить его значение в переменную "ssh_keys" в файле vm.tf
6. Установить на локальной машине (с которой будет выполняться terraform apply) Ansible, если еще не установлен.
7. Выполнить в терминале (из которого будет выпoлняться terraform apply): export ANSIBLE_HOST_KEY_CHECKING=False чтобы Ansible не висел на этапе подтверждения remote host key fingerprint.
8. terraform init
9. terraform apply
10. В конце исполнения манифеста terraform покажет public IP созданной ВМ. Для проверки работоспособности NGINX нужно выполнить:
   curl <public_IP>
