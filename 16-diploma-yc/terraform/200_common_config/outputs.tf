output "yc-zone" {
  value = var.yc-zone
}

output "current-workspace-name" {
  value = terraform.workspace
}

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
