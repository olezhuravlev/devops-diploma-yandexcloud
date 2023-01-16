# Yandex.Cloud zone.
variable "yc-zone" {
  default = "ru-central1"
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

# CIDR for private subnet 1.
variable "ipv4_cidr_private_subnet1" {
  default = "192.168.10.0/24"
}

# CIDR for private subnet 2.
variable "ipv4_cidr_private_subnet2" {
  default = "192.168.20.0/24"
}

# CIDR for private subnet 3.
variable "ipv4_cidr_private_subnet3" {
  default = "192.168.30.0/24"
}
