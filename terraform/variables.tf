# Cloud ID.
variable "yandex-cloud-id" {
  default = "b1g8mq58h421raomnd64"
}

# Zone 1.
variable "yandex-cloud-zone1" {
  default = "ru-central1-a"
}

# Zone 2.
variable "yandex-cloud-zone2" {
  default = "ru-central1-b"
}

# Zone 3.
variable "yandex-cloud-zone3" {
  default = "ru-central1-c"
}

# CIDR for private subnet.
variable "ipv4_cidr_private_subnet1" {
  default = "192.168.10.0/24"
}

# CIDR for private subnet.
variable "ipv4_cidr_private_subnet2" {
  default = "192.168.20.0/24"
}

# CIDR for private subnet.
variable "ipv4_cidr_private_subnet3" {
  default = "192.168.30.0/24"
}

# CIDR for private subnet.
variable "ipv4_cidr_public_subnet1" {
  default = "192.168.40.0/24"
}

variable "ipv4_cidr_public_subnet2" {
  default = "192.168.50.0/24"
}

variable "ipv4_cidr_public_subnet3" {
  default = "192.168.60.0/24"
}

variable "backend_bucket_id" {
  default = "tf-backend"
}

variable "access_key" {
  description = "access_key"
  type        = string
  sensitive   = true
}
variable "secret_key" {
  description = "secret_key"
  type        = string
  sensitive   = true
}