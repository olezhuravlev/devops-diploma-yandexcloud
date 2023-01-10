# Create Storage Bucket.
resource "yandex_storage_bucket" "storage-bucket" {
  bucket     = var.backend_bucket_id
  access_key = var.access_key
  secret_key = var.secret_key

  anonymous_access_flags {
    read = false
    list = false
  }
}
