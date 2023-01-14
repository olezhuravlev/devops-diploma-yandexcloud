# Subnet of the network.
resource "yandex_vpc_subnet" "vpc-subnet-public1" {
  name           = "vpc-subnet-public1"
  folder_id      = data.terraform_remote_state.vpc.outputs.yc-folder-id
  network_id     = yandex_vpc_network.vpc-network-public.id
  zone           = data.terraform_remote_state.vpc.outputs.yc-zone-1
  v4_cidr_blocks = [var.ipv4_cidr_public_subnet1]
}

# Subnet of the network.
resource "yandex_vpc_subnet" "vpc-subnet-public2" {
  name           = "vpc-subnet-public2"
  folder_id      = data.terraform_remote_state.vpc.outputs.yc-folder-id
  network_id     = yandex_vpc_network.vpc-network-public.id
  zone           = data.terraform_remote_state.vpc.outputs.yc-zone-2
  v4_cidr_blocks = [var.ipv4_cidr_public_subnet2]
}

# Subnet of the network.
resource "yandex_vpc_subnet" "vpc-subnet-public3" {
  name           = "vpc-subnet-public3"
  folder_id      = data.terraform_remote_state.vpc.outputs.yc-folder-id
  network_id     = yandex_vpc_network.vpc-network-public.id
  zone           = data.terraform_remote_state.vpc.outputs.yc-zone-3
  v4_cidr_blocks = [var.ipv4_cidr_public_subnet3]
}
