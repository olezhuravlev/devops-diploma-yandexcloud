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
  cloud_id = var.yandex-cloud-id
  zone     = var.yandex-cloud-zone1
}

# Create folder.
resource "yandex_resourcemanager_folder" "diploma-folder" {
  cloud_id = var.yandex-cloud-id
  name     = var.folder-name
  #name     = "${var.folder-name}-${terraform.workspace}"
}
