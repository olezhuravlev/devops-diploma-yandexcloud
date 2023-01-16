# Config to test 'for_each' operator.
module "vm-test-for-each" {
  source        = "./modules/instance"
  subnet_id     = yandex_vpc_subnet.vpc-subnet-private1.id
  cores         = local.cores[terraform.workspace]
  disk_size     = local.disk_size[terraform.workspace]
  instance_type = local.instance_type[terraform.workspace]

  #  We'll use 'for_each' here instead of 'count'.
  instance_count = 1
  for_each       = toset(["vm-1", "vm-2", "vm-3"])
  instance_name  = each.key
  image_family   = "centos-7"
  instance_zone  = yandex_vpc_subnet.vpc-subnet-private1.zone

  nat = true
}

locals {
  cores = {
    stage = 2
    prod  = 4
  }
  disk_size = {
    stage = 20
    prod  = 40
  }
  instance_count = {
    stage = 1
    prod  = 2
  }
  instance_type = {
    stage = "standard-v1"
    prod  = "standard-v2"
  }
}
