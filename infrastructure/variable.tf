variable "platform_id" {
    description = "идентификатор платформы"
    type        = string
    default     = "standard-v1"    
}

variable "number_vcpu" {
  default = 2
  description = "VCPU cores"
}

variable "number_ram" {
  default = 2
  description = "RAM Gb"
}

variable "preemptible" {
  default = true
  description = "ВМ прерываемая"
}

variable "image_id" {
  default = "fd8tckeqoshi403tks4l"
  description = "Образ ВМ"
}

variable "size_vm" {
  default = 40
  description = "Размер диска в Гб"
}

variable "vm_count" {
  type = number
  default = 1
}

variable "vm_name" {
  default = "momo-store-vm"
}

variable "nat_ip_address" {
    default = "158.160.29.83"
}

variable "subnet_id" {
  default = "e2lv1f9j9prmaajeio2l"
}

variable "s3_access_key" {
  description = "секрет s3_access_key"
}

variable "s3_secret_key" {
  description = "секрет s3_secret_key"
}

variable "zone_id" {
  default = "ru-central1-b"
}
