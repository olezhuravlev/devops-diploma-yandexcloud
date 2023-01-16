# Create folder.
resource "yandex_resourcemanager_folder" "diploma-folder" {
  name     = var.yc-folder-name
}
