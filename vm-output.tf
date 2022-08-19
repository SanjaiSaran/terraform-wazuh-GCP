output "Wazuh-Indexer" {
  value = google_compute_instance.wazuh-indexer.name
}

output "Wazuh-Server" {
  value = google_compute_instance.wazuh-server.name
}

output "Wazuh-Dashboard" {
  value = google_compute_instance.wazuh-dashboard.name
}


output "vm-external-ip3" {
  value = google_compute_instance.wazuh-dashboard.network_interface.0.access_config.0.nat_ip
}

output "vm-internal-ip" {
  value = google_compute_instance.wazuh-indexer.network_interface.0.network_ip
}

output "vm-internal-ip2" {
  value = google_compute_instance.wazuh-server.network_interface.0.network_ip
}

output "vm-internal-ip3" {
  value = google_compute_instance.wazuh-dashboard.network_interface.0.network_ip
}