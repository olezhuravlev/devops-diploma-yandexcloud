output "yc-folder-id" {
  value = yandex_resourcemanager_folder.diploma-folder.id
}

output "access_key" {
  sensitive = true
  value = yandex_iam_service_account_static_access_key.bucket-static_access_key.access_key
}

output "secret_key" {
  sensitive = true
  value = yandex_iam_service_account_static_access_key.bucket-static_access_key.secret_key
}
