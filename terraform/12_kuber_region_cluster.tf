#resource "yandex_kubernetes_cluster" "kubernetes-cluster-regional" {
#  name                    = "kubernetes-cluster-regional"
#  folder_id               = yandex_resourcemanager_folder.application-folder.id
#  network_id              = yandex_vpc_network.vpc-network.id
#  service_account_id      = yandex_iam_service_account.kuber-cluster-service-account.id
#  node_service_account_id = yandex_iam_service_account.kuber-nodes-service-account.id
#  release_channel         = "STABLE"
#  network_policy_provider = "CALICO"
#
#  labels = {
#    app = "neto15_4"
#  }
#
#  # depends_on = [
#  #   yandex_resourcemanager_folder_iam_binding.k8s-clusters-agent,
#  #   yandex_resourcemanager_folder_iam_binding.vpc-public-admin,
#  #   yandex_resourcemanager_folder_iam_binding.images-puller
#  # ]
#
#  master {
#    #version   = "1.21"
#    public_ip = true
#
#    regional {
#      region = "ru-central1"
#
#      location {
#        zone      = yandex_vpc_subnet.vpc-subnet-private1.zone
#        subnet_id = yandex_vpc_subnet.vpc-subnet-private1.id
#      }
#
#      location {
#        zone      = yandex_vpc_subnet.vpc-subnet-private2.zone
#        subnet_id = yandex_vpc_subnet.vpc-subnet-private2.id
#      }
#
#      location {
#        zone      = yandex_vpc_subnet.vpc-subnet-private3.zone
#        subnet_id = yandex_vpc_subnet.vpc-subnet-private3.id
#      }
#    }
#
#    maintenance_policy {
#      auto_upgrade = true
#      # Any time when omitted.
#      # maintenance_window {
#      #   day        = "monday"
#      #   start_time = "15:00"
#      #   duration   = "3h"
#      # }
#    }
#
#    security_group_ids = [
#      yandex_vpc_security_group.k8s-main-sg.id,
#      yandex_vpc_security_group.k8s-master-whitelist.id
#    ]
#  }
#
#  kms_provider {
#    key_id = yandex_kms_symmetric_key.key-a.id
#  }
#}
