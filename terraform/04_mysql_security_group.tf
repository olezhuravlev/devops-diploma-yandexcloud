#resource "yandex_vpc_security_group" "mysql-security-group" {
#  name       = "mysql-security-group"
#  folder_id  = yandex_resourcemanager_folder.application-folder.id
#  network_id = yandex_vpc_network.vpc-network.id
#
#  # All incoming connections on port 3306 to allow connection to MySQl.
#  ingress {
#    description    = "MySQL"
#    protocol       = "TCP"
#    v4_cidr_blocks = ["0.0.0.0/0"]
#    port           = 3306
#  }
#
#  ingress {
#    protocol       = "ANY"
#    description    = "Ingress rule"
#    v4_cidr_blocks = ["0.0.0.0/0"]
#    from_port      = 1
#    to_port        = 65535
#  }
#
#  egress {
#    protocol       = "ANY"
#    description    = "Egress rule"
#    v4_cidr_blocks = ["0.0.0.0/0"]
#    from_port      = 1
#    to_port        = 65535
#  }
#}
