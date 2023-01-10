#resource "yandex_mdb_mysql_cluster" "mysql-cluster" {
#  folder_id           = yandex_resourcemanager_folder.application-folder.id
#  network_id          = yandex_vpc_network.vpc-network.id
#  name                = "mysql-cluster"
#  environment         = "PRESTABLE"
#  version             = "8.0"
#  security_group_ids  = [yandex_vpc_security_group.mysql-security-group.id]
#  deletion_protection = true
#
#  resources {
#    resource_preset_id = "b1.medium" # RAM 4Gb
#    disk_type_id       = "network-ssd"
#    disk_size          = 20
#  }
#
#  access {
#    web_sql   = true
#    data_lens = true
#  }
#
#  maintenance_window {
#    type = "ANYTIME"
#  }
#
#  backup_window_start {
#    hours   = 23
#    minutes = 59
#  }
#
#  mysql_config = {
#    sql_mode                      = "ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION"
#    max_connections               = 100
#    default_authentication_plugin = "MYSQL_NATIVE_PASSWORD"
#    innodb_print_all_deadlocks    = true
#  }
#
#  host {
#    zone      = var.yandex-cloud-zone1
#    subnet_id = yandex_vpc_subnet.vpc-subnet-private1.id
#  }
#
#  host {
#    zone      = var.yandex-cloud-zone2
#    subnet_id = yandex_vpc_subnet.vpc-subnet-private2.id
#  }
#
#  host {
#    zone      = var.yandex-cloud-zone3
#    subnet_id = yandex_vpc_subnet.vpc-subnet-private3.id
#  }
#}
