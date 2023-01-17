# Subnet of the network.
resource "yandex_vpc_subnet" "vpc-subnet-private1" {
  #count = terraform.workspace == "prod" ? 1 : 0
  name           = "vpc-subnet-private1"
  network_id     = yandex_vpc_network.vpc-network-private.id
  zone           = var.yandex-cloud-zone1
  v4_cidr_blocks = [var.ipv4_cidr_private_subnet1]
}

# Subnet of the network.
resource "yandex_vpc_subnet" "vpc-subnet-private2" {
  #count = terraform.workspace == "stage" ? 1 : 0
  name           = "vpc-subnet-private2"
  network_id     = yandex_vpc_network.vpc-network-private.id
  zone           = var.yandex-cloud-zone2
  v4_cidr_blocks = [var.ipv4_cidr_private_subnet2]
}

# Subnet of the network.
resource "yandex_vpc_subnet" "vpc-subnet-private3" {
  #count = terraform.workspace == "stage" ? 1 : 0
  name           = "vpc-subnet-private3"
  network_id     = yandex_vpc_network.vpc-network-private.id
  zone           = var.yandex-cloud-zone3
  v4_cidr_blocks = [var.ipv4_cidr_private_subnet3]
}
