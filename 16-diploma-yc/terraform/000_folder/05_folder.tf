# Create folder.
resource "yandex_resourcemanager_folder" "diploma-folder" {
  cloud_id = var.yc-id
  name     = var.yc-folder-name
  #name     = "${var.folder-name}-${terraform.workspace}"
}
