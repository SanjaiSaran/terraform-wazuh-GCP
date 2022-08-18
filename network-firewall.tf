#Allow http
resource "google_compute_firewall" "allow-http" {
name = "${var.app_name}-${var.app_environment}-fw-allow-http"
network = "${google_compute_network.vpc.name}"
allow {
    protocol = "tcp"
    ports    = ["80"]
  }
  target_tags = ["http"] 
  source_tags = ["foo"]
}

# allow https
resource "google_compute_firewall" "allow-https" {
  name    = "${var.app_name}-${var.app_environment}-fw-allow-https"
  network = "${google_compute_network.vpc.name}"
  allow {
    protocol = "tcp"
    ports    = ["443"]
  }
  target_tags = ["https"] 
  source_tags = ["foo"]
}
#allow ssh
resource "google_compute_firewall" "allow-ssh" {
name = "${var.app_name}-${var.app_environment}-fw-allow-ssh"
network = "${google_compute_network.vpc.name}"
allow {
protocol = "tcp"
ports = [ "22" ]
}  
source_tags = ["foo"]
target_tags = [ "ssh" ]
}

