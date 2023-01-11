terraform {
  backend "s3" {
    endpoint = "storage.yandexcloud.net"
    bucket   = "tf-backend"
    region   = "ru-central1-a"
    key      = "terraform.tfstate"
    # access_key provided via AWS_ACCESS_KEY_ID
    # secret_key provided via AWS_SECRET_ACCESS_KEY

    skip_region_validation      = true
    skip_credentials_validation = true
  }
}
