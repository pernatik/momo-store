resource "yandex_vpc_address" "momo-address" {
  name = "momo-addr"
  external_ipv4_address {
    zone_id = var.zone_id
  }
}

resource "yandex_compute_instance" "vm-1" {
  name = var.vm_name

  resources {
    cores  = var.number_vcpu
    memory = var.number_ram
  }

  boot_disk {
    initialize_params {
      image_id = var.image_id
      size     = var.size_vm
    }
  }

  network_interface {
    subnet_id      = var.subnet_id
    nat            = true
    nat_ip_address = var.nat_ip_address
  }

  metadata = {
    user-data = "${file("./meta.txt")}"
  }
}

output "ip_address" {
  value = yandex_compute_instance.vm-1.network_interface.0.ip_address
}

output "external_ip_address" {
  value = yandex_compute_instance.vm-1.network_interface.0.nat_ip_address
}
