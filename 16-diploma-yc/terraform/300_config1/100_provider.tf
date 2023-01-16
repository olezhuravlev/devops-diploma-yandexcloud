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
  zone = var.yc-zone
}

data "terraform_remote_state" "vpc" {
  backend   = "s3"
  workspace = terraform.workspace
  config    = {
    endpoint = "storage.yandexcloud.net"
    bucket   = "tf-backend"
    region   = "ru-central1"
    key      = "tfstate"
    # access_key provided via AWS_ACCESS_KEY_ID
    # secret_key provided via AWS_SECRET_ACCESS_KEY

    skip_region_validation      = true
    skip_credentials_validation = true
    workspace_key_prefix        = "workspaces"
  }
}
