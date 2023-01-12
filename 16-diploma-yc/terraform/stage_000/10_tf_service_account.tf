# Service Account to be used by Terraform.
resource "yandex_iam_service_account" "terraform-sa" {
  folder_id   = yandex_resourcemanager_folder.diploma-folder.id
  name        = "terraform-sa"
  description = "Service account to allow Terraform to manage catalog"
}

# Role "editor" holders.
resource "yandex_resourcemanager_folder_iam_binding" "editor" {
  folder_id   = yandex_resourcemanager_folder.diploma-folder.id
  role      = "editor"
  members   = [
    "serviceAccount:${yandex_iam_service_account.terraform-sa.id}"
  ]
}

# Role "storage-admin" holders.
resource "yandex_resourcemanager_folder_iam_binding" "storage-admin" {
  folder_id   = yandex_resourcemanager_folder.diploma-folder.id
  role      = "storage.admin"
  members   = [
    "serviceAccount:${yandex_iam_service_account.terraform-sa.id}"
  ]
}

# Allowance to work with encription/decryption.
resource "yandex_resourcemanager_folder_iam_binding" "encrypterDecrypter" {
  folder_id   = yandex_resourcemanager_folder.diploma-folder.id
  role      = "kms.keys.encrypterDecrypter"
  members   = [
    "serviceAccount:${yandex_iam_service_account.terraform-sa.id}"
  ]
}

# Create Static Access Key.
resource "yandex_iam_service_account_static_access_key" "bucket-static_access_key" {
  service_account_id = yandex_iam_service_account.terraform-sa.id
  description        = "Static access key for Terraform Backend Bucket"
}
