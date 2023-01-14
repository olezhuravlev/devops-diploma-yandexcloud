output "yc-cloud-id" {
  value = var.yandex-cloud-id
}

output "yc-folder-id" {
  value = yandex_resourcemanager_folder.diploma-folder.id
}

output "yc-zone-1" {
  value = var.yandex-cloud-zone1
}

output "yc-zone-2" {
  value = var.yandex-cloud-zone2
}

output "yc-zone-3" {
  value = var.yandex-cloud-zone3
}
