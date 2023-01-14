terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

provider "yandex" {
  cloud_id = data.terraform_remote_state.vpc.outputs.yc-cloud-id
  zone     = data.terraform_remote_state.vpc.outputs.yc-zone-1
}

data "terraform_remote_state" "vpc" {
  backend = "s3"
  config  = {
    endpoint = "storage.yandexcloud.net"
    bucket   = "tf-backend"
    region   = "ru-central1"
    key      = "tfstate"
    # access_key provided via AWS_ACCESS_KEY_ID
    # secret_key provided via AWS_SECRET_ACCESS_KEY

    skip_region_validation      = true
    skip_credentials_validation = true
    workspace_key_prefix        = "tf-state"
  }
}
