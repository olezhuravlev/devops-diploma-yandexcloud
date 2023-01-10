output "current-workspace-name" {
  value = terraform.workspace
}

output "vpc-network-private-id" {
  value = yandex_vpc_network.vpc-network-private.id
}

output "vpc-subnet-private1-id" {
  value = yandex_vpc_subnet.vpc-subnet-private1.id
}

output "vpc-subnet-private2-id" {
  value = yandex_vpc_subnet.vpc-subnet-private2.id
}

output "vpc-subnet-private3-id" {
  value = yandex_vpc_subnet.vpc-subnet-private3.id
}

output "vpc-subnet-private1-zone" {
  value = yandex_vpc_subnet.vpc-subnet-private1.zone
}

output "vpc-subnet-private2-zone" {
  value = yandex_vpc_subnet.vpc-subnet-private2.zone
}

output "vpc-subnet-private3-zone" {
  value = yandex_vpc_subnet.vpc-subnet-private3.zone
}

####################################################
# A unique identifier for this run.
variable "TFC_RUN_ID" {
  type    = string
  default = ""
}

output "remote_execution_determine" {
  value = "Run environment: %{if var.TFC_RUN_ID != ""}Remote%{else}Local%{endif}"
}

output "network-id" {
  value = yandex_vpc_network.vpc-network-private.id
}
