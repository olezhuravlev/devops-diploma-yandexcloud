output "current-workspace-name" {
  value = terraform.workspace
}

output "yc-folder-id" {
  value = yandex_resourcemanager_folder.diploma-folder.id
}
