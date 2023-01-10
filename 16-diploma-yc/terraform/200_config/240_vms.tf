# Create service account.
#resource "yandex_iam_service_account" "kubernetes-iam-sa" {
#  folder_id   = yandex_resourcemanager_folder.kubernetes-folder.id
#  name        = "kubernetes-iam-sa-${terraform.workspace}"
#  description = "Service account to be used by Terraform"
#}

# Grant permission "container-registry" on folder "yandex-folder-id" for service account.
#resource "yandex_resourcemanager_folder_iam_member" "iam-member-storage-editor" {
#  folder_id = yandex_resourcemanager_folder.kubernetes-folder.id
#  role      = "container-registry.admin"
#  member    = "serviceAccount:${yandex_iam_service_account.kubernetes-iam-sa.id}"
#}

# Create Static Access Keys
#resource "yandex_iam_service_account_static_access_key" "terraform-sa-static-key" {
#  service_account_id = yandex_iam_service_account.kubernetes-iam-sa.id
#  description        = "Static access key for service account"
#}

# Use keys to create bucket
#resource "yandex_storage_bucket" "kubernetes-bucket" {
#  access_key = yandex_iam_service_account_static_access_key.terraform-sa-static-key.access_key
#  secret_key = yandex_iam_service_account_static_access_key.terraform-sa-static-key.secret_key
#  bucket     = "kubernetes-bucket-${terraform.workspace}"
#  grant {
#    id          = yandex_iam_service_account.kubernetes-iam-sa.id
#    type        = "CanonicalUser"
#    permissions = ["READ", "WRITE"]
#  }
#}
#
#resource "yandex_vpc_security_group" "nodes-ssh-access" {
#
#  name        = "redis-nodes-ssh-access"
#  description = "Connection via SSH. Should be applied only to group of nodes."
#  folder_id   = yandex_resourcemanager_folder.kubernetes-folder.id
#  network_id  = yandex_vpc_network.kubernetes-network.id
#
#  ingress {
#    protocol       = "TCP"
#    description    = "Allow connection via SSH from designated nodes."
#    v4_cidr_blocks = ["0.0.0.0/0"]
#    port           = 22
#  }
#
#  ingress {
#    protocol       = "ANY"
#    description    = "Redis Cluster client connections."
#    v4_cidr_blocks = ["0.0.0.0/0"]
#    port           = 6379
#  }
#
#  ingress {
#    protocol       = "ANY"
#    description    = "Redis Cluster bus connections."
#    v4_cidr_blocks = ["0.0.0.0/0"]
#    port           = 16379
#  }

#  ingress {
#    protocol       = "ANY"
#    description    = "All incoming traffic allowed."
#    v4_cidr_blocks = ["0.0.0.0/0"]
#    from_port      = 0
#    to_port        = 65535
#  }
#
#  egress {
#    protocol       = "ANY"
#    description    = "All outgoing traffic allowed."
#    v4_cidr_blocks = ["0.0.0.0/0"]
#    from_port      = 0
#    to_port        = 65535
#  }
#}

module "vm-for-each" {
  source         = "./modules/instance"
  #sec_group_id   = yandex_vpc_security_group.nodes-ssh-access.id
  cores          = local.cores[each.key]
  memory         = local.memory[each.key]
  boot_disk_size = local.boot_disk_size[each.key]
  boot_disk_type = "network-hdd"
  users          = "ubuntu"

  for_each      = toset(["cp1", "node1", "node2", "teamcity-server", "teamcity-agent"])
  instance_name = each.key
  image_family  = local.image_family[each.key]
  instance_zone = local.ipv4_zones[each.key]
  subnet_id     = local.ipv4_subnets[each.key]
  ipv4_internal = local.ipv4_internals[each.key]
  nat           = local.ipv4_nats[each.key]
  core_fraction = local.core_fraction[each.key]
}

locals {

  # CPU total 32 max!
  cores = {
    cp1             = 4
    node1           = 2
    node2           = 2
    teamcity-server = 4
    teamcity-agent  = 2
  }

  # RAM total 128Gb max!
  memory = {
    cp1             = 4
    node1           = 2
    node2           = 2
    teamcity-server = 8
    teamcity-agent  = 2
  }

  # HDD total 500Gb max!
  boot_disk_size = {
    cp1             = 51
    node1           = 51
    node2           = 51
    teamcity-server = 51
    teamcity-agent  = 51
  }

  image_family = {
    cp1             = "ubuntu-2004-lts"
    node1           = "ubuntu-2004-lts"
    node2           = "ubuntu-2004-lts"
    teamcity-server = "container-optimized-image"
    teamcity-agent  = "container-optimized-image"
  }

  ipv4_zones = {
    cp1             = var.yandex-cloud-zone1
    node1           = var.yandex-cloud-zone2
    node2           = var.yandex-cloud-zone3
    teamcity-server = var.yandex-cloud-zone1
    teamcity-agent  = var.yandex-cloud-zone1
  }

  ipv4_subnets = {
    cp1             = yandex_vpc_subnet.vpc-subnet-private1.id
    node1           = yandex_vpc_subnet.vpc-subnet-private2.id
    node2           = yandex_vpc_subnet.vpc-subnet-private3.id
    teamcity-server = yandex_vpc_subnet.vpc-subnet-private1.id
    teamcity-agent  = yandex_vpc_subnet.vpc-subnet-private1.id
  }

  ipv4_internals = {
    cp1             = "10.10.10.1"
    node1           = "10.20.20.1"
    node2           = "10.30.30.1"
    teamcity-server = "10.10.10.10"
    teamcity-agent  = "10.10.10.20"
  }

  ipv4_nats = {
    cp1             = true
    node1           = true
    node2           = true
    teamcity-server = true
    teamcity-agent  = true
  }

  core_fraction = {
    cp1             = 20
    node1           = 20
    node2           = 20
    teamcity-server = 100
    teamcity-agent  = 20
  }
}
