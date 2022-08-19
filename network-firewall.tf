#Allow ssh-internal
resource "google_compute_firewall" "allow-ssh-internal" {
name = "${var.app_name}-${var.app_environment}-fw-allow-ssh-internal"
network = "${google_compute_network.vpc.name}"
allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  target_tags = ["ssh-internal"] 
  source_ranges = [ 
    "${var.public_subnet_cidr_1}" 
    ]
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
}
#allow ssh
resource "google_compute_firewall" "allow-ssh" {
name = "${var.app_name}-${var.app_environment}-fw-allow-ssh"
network = "${google_compute_network.vpc.name}"
allow {
protocol = "tcp"
ports = [ "22" ]
}  
target_tags = [ "ssh" ]
}

#allow 9200
resource "google_compute_firewall" "allow-rest-api" {
name = "${var.app_name}-${var.app_environment}-fw-allow-rest-api"
network = "${google_compute_network.vpc.name}"
allow {
protocol = "tcp"
ports = [ "9200" ]
}  
target_tags = [ "rest-api" ]
source_ranges = [ 
    "${var.public_subnet_cidr_1}" 
    ]
}

#allow 9300-9400
resource "google_compute_firewall" "allow-cluster-communication" {
name = "${var.app_name}-${var.app_environment}-fw-allow-cluster-communication"
network = "${google_compute_network.vpc.name}"
allow {
protocol = "tcp"
ports = [ "9300-9400" ]
}  
target_tags = [ "cluster-communication" ]
source_ranges = [ 
    "${var.public_subnet_cidr_1}" 
    ]
}

#allow 1514
resource "google_compute_firewall" "agent-connection" {
name = "${var.app_name}-${var.app_environment}-fw-allow-agent-connection"
network = "${google_compute_network.vpc.name}"
allow {
protocol = "tcp"
ports = [ "1514" ]
}  
target_tags = [ "agent-connection" ]
source_ranges = [ 
    "${var.public_subnet_cidr_1}" 
    ]
}

#allow 1515
resource "google_compute_firewall" "agent-enrolment" {
name = "${var.app_name}-${var.app_environment}-fw-allow-agent-enrolment"
network = "${google_compute_network.vpc.name}"
allow {
protocol = "tcp"
ports = [ "1515" ]
}  
target_tags = [ "agent-enrolment" ]
source_ranges = [ 
    "${var.public_subnet_cidr_1}" 
    ]
}

#allow 1516
resource "google_compute_firewall" "cluster-daemon" {
name = "${var.app_name}-${var.app_environment}-fw-allow-cluster-daemon"
network = "${google_compute_network.vpc.name}"
allow {
protocol = "tcp"
ports = [ "1516" ]
}  
target_tags = [ "cluster-daemon" ]
source_ranges = [ 
    "${var.public_subnet_cidr_1}" 
    ]
}

#allow 514
resource "google_compute_firewall" "syslog-collector" {
name = "${var.app_name}-${var.app_environment}-fw-allow-syslog-collector"
network = "${google_compute_network.vpc.name}"
allow {
protocol = "tcp"
ports = [ "514" ]
}  
allow {
protocol = "udp"
ports = ["514"]  
} 
target_tags = [ "syslog-collector" ]
source_ranges = [ 
    "${var.public_subnet_cidr_1}" 
    ]
}

#allow 55000
resource "google_compute_firewall" "server-restful-api" {
name = "${var.app_name}-${var.app_environment}-fw-allow-server-restfull-api"
network = "${google_compute_network.vpc.name}"
allow {
protocol = "tcp"
ports = [ "55000" ]
} 
target_tags = [ "server-restfull-api" ]
source_ranges = [ 
    "${var.public_subnet_cidr_1}" 
    ]
}