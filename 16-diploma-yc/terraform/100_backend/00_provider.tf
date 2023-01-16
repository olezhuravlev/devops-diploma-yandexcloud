# Base Terraform provider definition.
terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

# Define provider.
provider "yandex" {
#  cloud_id = var.yc-id
#  folder_id = var.yc-folder-id
  zone     = var.yc-zone
}
