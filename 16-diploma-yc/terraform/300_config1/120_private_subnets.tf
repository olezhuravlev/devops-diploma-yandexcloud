## Subnet of the network.
#resource "yandex_vpc_subnet" "vpc-subnet-private1" {
#  count = terraform.workspace == "stage" ? 1 : 0
#  name           = "vpc-subnet-private1"
##  folder_id      = data.terraform_remote_state.vpc.outputs.yc-folder-id
#  network_id     = yandex_vpc_network.vpc-network-private.0.id
#  zone           = var.yandex-cloud-zone1
#  v4_cidr_blocks = [var.ipv4_cidr_private_subnet1]
#}
#
## Subnet of the network.
#resource "yandex_vpc_subnet" "vpc-subnet-private2" {
#  count = terraform.workspace == "stage" ? 1 : 0
#  name           = "vpc-subnet-private2"
##  folder_id      = data.terraform_remote_state.vpc.outputs.yc-folder-id
#  network_id     = yandex_vpc_network.vpc-network-private.0.id
#  zone           = var.yandex-cloud-zone2
#  v4_cidr_blocks = [var.ipv4_cidr_private_subnet2]
#}
#
## Subnet of the network.
#resource "yandex_vpc_subnet" "vpc-subnet-private3" {
#  count = terraform.workspace == "stage" ? 1 : 0
#  name           = "vpc-subnet-private3"
#  network_id     = yandex_vpc_network.vpc-network-private.0.id
#  zone           = var.yandex-cloud-zone3
#  v4_cidr_blocks = [var.ipv4_cidr_private_subnet3]
#}
#
## Subnet of the network.
#resource "yandex_vpc_subnet" "vpc-subnet-private4" {
#  count = terraform.workspace == "prod" ? 1 : 0
#  name           = "vpc-subnet-private4"
#  network_id     = yandex_vpc_network.vpc-network-private.0.id
#  zone           = var.yandex-cloud-zone1
#  v4_cidr_blocks = [var.ipv4_cidr_private_subnet4]
#}

# Subnet of the network.
resource "yandex_vpc_subnet" "vpc-subnet-prod" {
  count = terraform.workspace == "prod" ? 1 : 0
  name           = "vpc-subnet-prod"
  network_id     = data.terraform_remote_state.vpc.outputs.network-id
  zone           = var.yandex-cloud-zone1
  v4_cidr_blocks = [var.ipv4_cidr_private_subnet1]
}

# Subnet of the network.
resource "yandex_vpc_subnet" "vpc-subnet-stage" {
  count = terraform.workspace == "stage" ? 1 : 0
  name           = "vpc-subnet-stage"
  network_id     = data.terraform_remote_state.vpc.outputs.network-id
  zone           = var.yandex-cloud-zone1
  v4_cidr_blocks = [var.ipv4_cidr_private_subnet2]
}
