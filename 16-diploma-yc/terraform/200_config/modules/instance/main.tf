# Instance settings.
variable image_family { default = "centos-7" }
variable users { default = "centos" }

variable folder_id { default = "" }
variable subnet_id { default = "" }
#variable sec_group_id {}

#variable instance_count { default = 1 }
variable instance_name { default = "" }
variable instance_description { default = "" }
variable instance_type { default = "standard-v1" }
variable instance_zone { default = "ru-central1-a" }

# VM settings.
variable cores { default = 2 }
variable core_fraction { default = 20 }
variable memory { default = 2 }
variable nat { default = "false" }
variable ipv4_internal { default = "" }
variable boot_disk_type { default = "network-ssd" }
variable boot_disk_size { default = 20 }

# Provider must be specified in every module.
terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

# Retrieves existing public image of a family.
data "yandex_compute_image" "image" {
  family = var.image_family
}

# Declare instance.
resource "yandex_compute_instance" "instance" {
  #count       = var.instance_count
  name        = var.instance_name
  description = var.instance_description
  platform_id = var.instance_type
  hostname    = var.instance_name
  zone        = var.instance_zone
  folder_id   = var.folder_id

  resources {
    cores         = var.cores
    core_fraction = var.core_fraction
    memory        = var.memory
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.image.id
      type     = var.boot_disk_type
      size     = var.boot_disk_size
    }
  }
  network_interface {
    subnet_id = var.subnet_id
    nat       = var.nat
    ipv4      = true
    ip_address = var.ipv4_internal
    #security_group_ids = [var.sec_group_id]
  }

  metadata = {
    ssh-keys = "${var.users}:${file("~/.ssh/id_rsa.pub")}"
  }

  allow_stopping_for_update = true
}
