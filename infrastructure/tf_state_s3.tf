# 
terraform {
  required_version = ">= 0.13"
  backend "s3" {
    endpoint   = "storage.yandexcloud.net"
    bucket     = "momo-tf-state"
    region     = "ru-central1"
    key        = "terraform.tfstate"
    access_key = "YCAJEbZKbqyhhmhK2c17ZW9-y"
    secret_key = "YCPzFOyH-CknloVxfbj0frknzE-hiAdTGdHLp-lN"

    skip_region_validation      = true
    skip_credentials_validation = true
  }
}