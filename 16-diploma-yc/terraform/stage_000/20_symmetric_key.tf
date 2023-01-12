# KMS symmetric key to cypher data in Storage Bucket.
resource "yandex_kms_symmetric_key" "key-a" {
  folder_id   = yandex_resourcemanager_folder.diploma-folder.id
  name              = "symmetric-key"
  description       = "Simmetric key"
  default_algorithm = "AES_128"
  rotation_period   = "8760h"
  lifecycle {
    prevent_destroy = false
  }
}
