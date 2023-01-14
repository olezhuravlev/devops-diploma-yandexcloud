# Create network.
resource "yandex_vpc_network" "vpc-network-private" {
  folder_id = data.terraform_remote_state.vpc.outputs.yc-folder-id
  name      = "vpc-network-private"
}
