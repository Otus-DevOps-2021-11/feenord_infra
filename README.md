# feenord_infra
feenord Infra repository

#Решение для самостоятельного и дополнительного задания
#Необходимо создать файл config в директории /home/user_name/.ssh
#внутри самого файла config


#Host bastion
#
#    HostName (указать публичный IP сервера)
#
#    User (Указать Имя пользователя)
#
#    Port (Указать порт подключения)
#
#    IdentityFile (/User_name/.ssh/id_rsa указать где лежит закрытый ключ)
#
#Host someinternalhost
#
#    ProxyJump bastion (указать функцию ProxyJump)
#
#    User (Указать Имя пользователя)
#
#    Port (Указать порт подключения)
#
#    IdentityFile (/User_name/.ssh/id_rsa указать где лежит закрытый ключ)
#
#После сохранения конфига перезагружаем службу ssh
#
#Теперь мы можем просто авторизоваться командой "shh bastion" "ssh someinternalhost"- сюда сразу попадает через host bastion используя только ключ
#
#Установка необходимых репозиториев
#
#Установка EPEL:
#
#yum install epel-release -y
#
# Установка репозитория Mongo:
#
# tee /etc/yum.repos.d/mongodb-org-4.2.repo << EOF
# [mongodb-org-4.2]
# name=MongoDB Repository
# baseurl=https://repo.mongodb.org/yum/redhat/7/mongodb-org/4.2/x86_64/
# gpgcheck=1
# enabled=1
# gpgkey=https://www.mongodb.org/static/pgp/server-4.2.asc
# EOF
#
# Установка репозитория Pritunl:
#
# tee /etc/yum.repos.d/pritunl.repo << EOF
# [pritunl]
# name=Pritunl Repository
# baseurl=https://repo.pritunl.com/stable/yum/centos/7/
# gpgcheck=1
# enabled=1
# EOF
#
# Установка ключей:
#
# gpg --keyserver hkp://keyserver.ubuntu.com --recv-keys 7568D9BB55FF9E5287D586017AE645C0CF8E292A
# gpg --armor --export 7568D9BB55FF9E5287D586017AE645C0CF8E292A > key.tmp; sudo rpm --import key.tmp; rm -f key.tmp
#
# Установка Mongo, Pritunl:
#
# yum -y install pritunl mongodb-org
#
# Далее необходимо включить и запустить сервисы:
#
# systemctl start mongod pritunl && systemctl enable mongod pritunl
#
# Настройка Pritunl
#
# pritunl setup-key
#
# Открыть в браузере мастер настройки Pritunl сервера набрав в адресной строке https://<Server IP> откроется страница:
# Указать ключ в поле "Enter Setup Key .." нажать Save, после кратковременной настройки Mongo базы откроется страница:
#
# Генерируем в терминале пароль для пользователя pritunl:
# Данные для входа вводим в соответствующие поля.
#

bastion_IP = 62.84.115.145
someinternalhost_IP = bastion
