# Service Account to be used by Terraform.
resource "yandex_iam_service_account" "terraform-sa" {
  folder_id   = yandex_resourcemanager_folder.diploma-folder.id
  name        = "terraform-sa"
  description = "Service account to allow Terraform to manage catalog"
}

# Role "editor" holders.
resource "yandex_resourcemanager_folder_iam_binding" "editor" {
  folder_id = yandex_resourcemanager_folder.diploma-folder.id
  role      = "editor"
  members   = [
    "serviceAccount:${yandex_iam_service_account.terraform-sa.id}"
  ]
}

# Role "storage-admin" holders.
resource "yandex_resourcemanager_folder_iam_binding" "storage-admin" {
  folder_id = yandex_resourcemanager_folder.diploma-folder.id
  role      = "storage.admin"
  members   = [
    "serviceAccount:${yandex_iam_service_account.terraform-sa.id}"
  ]
}
