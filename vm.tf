resource "random_id" "instance_id" {
 byte_length = 4
}

# Create VM #1 - Wazuh Indexer
resource "google_compute_instance" "wazuh-indexer" {
  name         = "${var.app_name}-${var.app_environment}-wazuh-indexer"
  machine_type = "e2-medium"
  zone         = var.gcp_zone_1
  hostname     = "${var.app_name}-vm-${random_id.instance_id.hex}.${var.app_domain}"
  tags         = [
    "ssh-internal",
    "cluster-communication",
    "rest-api"
 ]

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-1804-lts"
    }
  }

  metadata_startup_script = "sudo apt-get update"

   network_interface {
    network       = google_compute_network.vpc.name
    subnetwork    = google_compute_subnetwork.public_subnet_1.name
  }
} 
#Create VM #2 - Wazuh Server
resource "google_compute_instance" "wazuh-server" {
  name         = "${var.app_name}-${var.app_environment}-wazuh-server"
  machine_type = "e2-small"
  zone         = var.gcp_zone_1
  hostname     = "${var.app_name}-vm-${random_id.instance_id.hex}.${var.app_domain}"
  tags         = [
    "agent-connection",
    "agent-enrolment",
    "cluster-daemon",
    "syslog-collector",
    "server-restfull-api",
    "ssh-internal"
  ]

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-1804-lts"
      size = 500
    }
  }

  metadata_startup_script = "sudo apt-get update"

  network_interface {
    network       = google_compute_network.vpc.name
    subnetwork    = google_compute_subnetwork.public_subnet_1.name
  }
} 

#Create VM #3 - Wazuh Dashboard
resource "google_compute_instance" "wazuh-dashboard" {
  name         = "${var.app_name}-${var.app_environment}-wazuh-dashboard"
  machine_type = "e2-medium"
  zone         = var.gcp_zone_1
  hostname     = "${var.app_name}-vm-${random_id.instance_id.hex}.${var.app_domain}"
  tags         = ["ssh","https"]

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-1804-lts"
    }
  }

  metadata_startup_script = "sudo apt-get update"

  network_interface {
    network       = google_compute_network.vpc.name
    subnetwork    = google_compute_subnetwork.public_subnet_1.name
    access_config { }
  }
} 