#terraform {
#  backend "s3" {
##    #    endpoint = "storage.yandexcloud.net"
##    #    bucket   = "tf-backend"
##    #    region   = "ru-central1-a"
##    #    key      = "terraform.tfstate"
##    #    # access_key provided via AWS_ACCESS_KEY_ID
##    #    # secret_key provided via AWS_SECRET_ACCESS_KEY
##    #
##    #    skip_region_validation      = true
##    #    skip_credentials_validation = true
#    #workspace_key_prefix = "tf-state"
#  }
#}
#

#terraform init \
#-backend-config="endpoint=storage.yandexcloud.net" \
#-backend-config="bucket=tf-backend" \
#-backend-config="region=ru-central1-a" \
#-backend-config="key=tfstate" \
#-backend-config="access_key=YCAJEo11PEpUKVvr_UbYc-vIG" \
#-backend-config="secret_key=YCNqo5OHobEr1quQFfYlXgfyZWA18Ksob-5121f2" \
#-backend-config="skip_region_validation=true" \
#-backend-config="skip_credentials_validation=true" \
#-backend-config="workspace_key_prefix=ws" \
#-reconfigure
