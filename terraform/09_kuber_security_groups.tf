#resource "yandex_vpc_security_group" "k8s-master-whitelist" {
#  name        = "k8s-master-whitelist"
#  description = "Правила группы разрешают доступ к API Kubernetes из интернета. Примените правила только к кластеру."
#  folder_id   = yandex_resourcemanager_folder.application-folder.id
#  network_id  = yandex_vpc_network.vpc-network.id
#
#  ingress {
#    protocol       = "TCP"
#    description    = "Правило разрешает подключение к API Kubernetes через порт 6443 из указанной сети."
#    v4_cidr_blocks = ["0.0.0.0/0"]
#    port           = 6443
#  }
#
#  ingress {
#    protocol       = "TCP"
#    description    = "Правило разрешает подключение к API Kubernetes через порт 443 из указанной сети."
#    v4_cidr_blocks = ["0.0.0.0/0"]
#    port           = 443
#  }
#}
#
#resource "yandex_vpc_security_group" "k8s-main-sg" {
#  name        = "k8s-main-sg"
#  description = "Правила группы обеспечивают базовую работоспособность кластера. Примените ее к кластеру и группам узлов."
#  folder_id   = yandex_resourcemanager_folder.application-folder.id
#  network_id  = yandex_vpc_network.vpc-network.id
#  ingress {
#    protocol          = "TCP"
#    description       = "Правило разрешает проверки доступности с диапазона адресов балансировщика нагрузки. Нужно для работы отказоустойчивого кластера и сервисов балансировщика."
#    predefined_target = "loadbalancer_healthchecks"
#    from_port         = 0
#    to_port           = 65535
#  }
#  ingress {
#    protocol          = "ANY"
#    description       = "Правило разрешает взаимодействие мастер-узел и узел-узел внутри группы безопасности."
#    predefined_target = "self_security_group"
#    from_port         = 0
#    to_port           = 65535
#  }
#  ingress {
#    protocol       = "ANY"
#    description    = "Правило разрешает взаимодействие под-под и сервис-сервис. Укажите подсети вашего кластера и сервисов."
#    v4_cidr_blocks = [
#      var.ipv4_cidr_private_subnet1,
#      var.ipv4_cidr_private_subnet2,
#      var.ipv4_cidr_private_subnet3,
#      var.ipv4_cidr_public_subnet1,
#      var.ipv4_cidr_public_subnet2,
#      var.ipv4_cidr_public_subnet3
#    ]
#    from_port = 0
#    to_port   = 65535
#  }
#  ingress {
#    protocol       = "ICMP"
#    description    = "Правило разрешает отладочные ICMP-пакеты из внутренних подсетей."
#    v4_cidr_blocks = [
#      var.ipv4_cidr_private_subnet1,
#      var.ipv4_cidr_private_subnet2,
#      var.ipv4_cidr_private_subnet3,
#      var.ipv4_cidr_public_subnet1,
#      var.ipv4_cidr_public_subnet2,
#      var.ipv4_cidr_public_subnet3
#    ]
#  }
#  egress {
#    protocol       = "ANY"
#    description    = "Правило разрешает весь исходящий трафик. Узлы могут связаться с Yandex Container Registry, Object Storage, Docker Hub и т. д."
#    v4_cidr_blocks = ["0.0.0.0/0"]
#    from_port      = 0
#    to_port        = 65535
#  }
#}
#
#resource "yandex_vpc_security_group" "k8s-public-services" {
#  name        = "k8s-public-services"
#  description = "Правила группы разрешают подключение к сервисам из интернета. Примените правила только для групп узлов."
#  folder_id   = yandex_resourcemanager_folder.application-folder.id
#  network_id  = yandex_vpc_network.vpc-network.id
#
#  ingress {
#    protocol       = "TCP"
#    description    = "Правило разрешает входящий трафик из интернета на диапазон портов NodePort. Добавьте или измените порты на нужные вам."
#    v4_cidr_blocks = ["0.0.0.0/0"]
#    from_port      = 30000
#    to_port        = 32767
#  }
#}
#
#resource "yandex_vpc_security_group" "k8s-nodes-ssh-access" {
#  name        = "k8s-nodes-ssh-access"
#  description = "Правила группы разрешают подключение к узлам кластера по SSH. Примените правила только для групп узлов."
#  folder_id   = yandex_resourcemanager_folder.application-folder.id
#  network_id  = yandex_vpc_network.vpc-network.id
#
#  ingress {
#    protocol       = "TCP"
#    description    = "Правило разрешает подключение к узлам по SSH с указанных IP-адресов."
#    v4_cidr_blocks = ["0.0.0.0/0"]
#    port           = 22
#  }
#}
