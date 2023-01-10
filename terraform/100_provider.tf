# Base Terraform provider definition.
terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"

  backend "s3" {
    endpoint   = "storage.yandexcloud.net"
    bucket     = "tf-backend"
    region     = "ru-central1-a"
    key        = "backend/terraform.tfstate"
    access_key = "YCAJE6hn3fq55gxSM1xw6PFA-"
    secret_key = "YCOQGdJ6CuLDKIAqiDqYrvxStZxiUp8ecJqsYJtJ"

    skip_region_validation      = true
    skip_credentials_validation = true
  }
}

# Define provider.
provider "yandex" {
  cloud_id = var.yandex-cloud-id
  zone     = var.yandex-cloud-zone1
}

# Create folder.
resource "yandex_resourcemanager_folder" "diploma-folder" {
  cloud_id = var.yandex-cloud-id
  name     = "diploma-folder"
}
