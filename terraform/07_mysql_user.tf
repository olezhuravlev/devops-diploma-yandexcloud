#resource "yandex_mdb_mysql_user" "mysql-user" {
#  cluster_id = yandex_mdb_mysql_cluster.mysql-cluster.id
#  name       = "mysql"
#  password   = "mysql123"
#
#  permission {
#    database_name = yandex_mdb_mysql_database.netology_db.name
#    # SELECT: This privilege is for read-only, if a user gets SELECT privilege then they will only be able to view databases.
#    # CREATE: This privilege is for creating tables, if a user gets CREATE privilege then they will be able to create a new table.
#    # INSERT: This privilege is for inserting i   qnto the table, if the user gets INSERT privilege then they will be able to insert new records into the table.
#    # DELETE: This privilege is for deleting from the table, if the user gets DELETE privilege then they will be able to delete records from the table.
#    # DROP: This privilege is for dropping tables, if a user gets DROP privilege then they’ll be able to drop the table.
#    # UPDATE: This privilege is for updating tables, if a user gets the UPDATE privilege then they’ll be able to update the existing records.
#    # ALTER: This privilege is for altering table definition, if the user gets ALTER privilege then they will be able to alter the table definition.
#    # ALL: This privilege is for all privileges, if the user gets ALL privileges then they will acquire all the above-mentioned privileges.
#    roles         = ["ALL"]
#  }
#
#  connection_limits {
#    max_questions_per_hour   = 10000
#    max_updates_per_hour     = 20000
#    max_connections_per_hour = 30000
#    max_user_connections     = 40000
#  }
#
#  global_permissions = ["PROCESS"]
#
#  authentication_plugin = "SHA256_PASSWORD"
#}
