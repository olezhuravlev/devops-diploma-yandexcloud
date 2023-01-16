output "yc-id" {
  value = var.yc-id
}

output "yc-folder-id" {
  value = yandex_resourcemanager_folder.diploma-folder.id
}

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
