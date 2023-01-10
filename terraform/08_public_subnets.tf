## Subnet of the network.
#resource "yandex_vpc_subnet" "vpc-subnet-public1" {
#  name           = "vpc-subnet-public1"
#  folder_id      = yandex_resourcemanager_folder.application-folder.id
#  network_id     = yandex_vpc_network.vpc-network.id
#  zone           = var.yandex-cloud-zone1
#  v4_cidr_blocks = [var.ipv4_cidr_public_subnet1]
#}
#
## Subnet of the network.
#resource "yandex_vpc_subnet" "vpc-subnet-public2" {
#  name           = "vpc-subnet-public2"
#  folder_id      = yandex_resourcemanager_folder.application-folder.id
#  network_id     = yandex_vpc_network.vpc-network.id
#  zone           = var.yandex-cloud-zone2
#  v4_cidr_blocks = [var.ipv4_cidr_public_subnet2]
#}
#
## Subnet of the network.
#resource "yandex_vpc_subnet" "vpc-subnet-public3" {
#  name           = "vpc-subnet-public3"
#  folder_id      = yandex_resourcemanager_folder.application-folder.id
#  network_id     = yandex_vpc_network.vpc-network.id
#  zone           = var.yandex-cloud-zone3
#  v4_cidr_blocks = [var.ipv4_cidr_public_subnet3]
#}
