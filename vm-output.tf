output "vm-name" {
  value = google_compute_instance.vm_instance.name
}

output "vm-name2" {
  value = google_compute_instance.vm_instance2.name
}

output "vm-name3" {
  value = google_compute_instance.vm_instance3.name
}

output "vm-external-ip" {
  value = google_compute_instance.vm_instance.network_interface.0.access_config.0.nat_ip
}

output "vm-external-ip2" {
  value = google_compute_instance.vm_instance2.network_interface.0.access_config.0.nat_ip  
}

output "vm-external-ip3" {
  value = google_compute_instance.vm_instance3.network_interface.0.access_config.0.nat_ip
}

output "vm-internal-ip" {
  value = google_compute_instance.vm_instance.network_interface.0.network_ip
}

output "vm-internal-ip2" {
  value = google_compute_instance.vm_instance2.network_interface.0.network_ip
}

output "vm-internal-ip3" {
  value = google_compute_instance.vm_instance3.network_interface.0.network_ip
}