# Subnet of the network.
resource "yandex_vpc_subnet" "vpc-subnet-private1" {
  name           = "vpc-subnet-private1"
  folder_id = data.terraform_remote_state.vpc.outputs.yc-folder-id
  network_id     = yandex_vpc_network.vpc-network.id
  zone           = var.yandex-cloud-zone1
  v4_cidr_blocks = [var.ipv4_cidr_private_subnet1]
}

# Subnet of the network.
resource "yandex_vpc_subnet" "vpc-subnet-private2" {
  name           = "vpc-subnet-private2"
  folder_id = data.terraform_remote_state.vpc.outputs.yc-folder-id
  network_id     = yandex_vpc_network.vpc-network.id
  zone           = var.yandex-cloud-zone2
  v4_cidr_blocks = [var.ipv4_cidr_private_subnet2]
}

# Subnet of the network.
resource "yandex_vpc_subnet" "vpc-subnet-private3" {
  name           = "vpc-subnet-private3"
  folder_id = data.terraform_remote_state.vpc.outputs.yc-folder-id
  network_id     = yandex_vpc_network.vpc-network.id
  zone           = var.yandex-cloud-zone3
  v4_cidr_blocks = [var.ipv4_cidr_private_subnet3]
}
