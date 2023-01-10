## KMS symmetric key to cypher data in Kubernetes cluster.
#resource "yandex_kms_symmetric_key" "key-a" {
#  folder_id         = yandex_resourcemanager_folder.application-folder.id
#  name              = "symmetric-key"
#  description       = "Simmetric key"
#  default_algorithm = "AES_128"
#  rotation_period   = "8760h"
#  lifecycle {
#    prevent_destroy = false
#  }
#}
#
#resource "yandex_kms_symmetric_key_iam_binding" "viewer" {
#  symmetric_key_id = yandex_kms_symmetric_key.key-a.id
#  role             = "viewer"
#  members          = [
#    "serviceAccount:${yandex_iam_service_account.kuber-cluster-service-account.id}",
#  ]
#}
