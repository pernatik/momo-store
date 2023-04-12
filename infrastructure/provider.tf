provider "yandex" {
  token     = var.token
  cloud_id  = "b1gao74sc5ajskfmfkcc"
  folder_id = "b1gebhhkrmg055oreag0"
  zone      = "ru-central1-b"
}

variable "token" {
  description = "yandex access token"
}

terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.89.0"
    }
  }
}