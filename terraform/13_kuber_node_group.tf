#resource "yandex_kubernetes_node_group" "node-group" {
#  cluster_id = yandex_kubernetes_cluster.kubernetes-cluster-regional.id
#  name       = "node-group"
#  #  version    = "1.20"
#
#  labels = {
#    app = "neto15_4"
#  }
#
#  instance_template {
#    platform_id = "standard-v1"
#
#    labels = {
#      app = "neto15_4"
#    }
#
#    network_interface {
#      nat        = true
#      subnet_ids = [
#        yandex_vpc_subnet.vpc-subnet-private1.id
#      ]
#      security_group_ids = [
#        yandex_vpc_security_group.k8s-main-sg.id,
#        yandex_vpc_security_group.k8s-public-services.id,
#        yandex_vpc_security_group.k8s-nodes-ssh-access.id
#      ]
#    }
#
#    container_runtime {
#      type = "containerd"
#    }
#
#    resources {
#      memory = 2
#      cores  = 2
#    }
#
#    boot_disk {
#      type = "network-ssd"
#      size = 30
#    }
#
#    scheduling_policy {
#      preemptible = false
#    }
#  }
#
#  scale_policy {
#    auto_scale {
#      min     = 3
#      max     = 6
#      initial = 3
#    }
#  }
#
#  allocation_policy {
#    location {
#      zone = var.yandex-cloud-zone1
#    }
#  }
#
#  maintenance_policy {
#    auto_upgrade = true
#    auto_repair  = true
#    # Any time when omitted.
#    # maintenance_window {
#    #   day        = "monday"
#    #   start_time = "15:00"
#    #   duration   = "3h"
#    # }
#  }
#}
