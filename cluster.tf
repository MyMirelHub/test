terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "6.8.0"
    }
  }
}

provider "google" {
  # Configuration options
}


resource "google_container_cluster" "admin" {
  name               = "okto-admin"
  location           = "us-central1-a"
  project = "octoproject-439420"

  initial_node_count = 1

  deletion_protection = false
}

resource "google_container_node_pool" "default" {
  name    = "gke-standard-regional-node-pool"
  cluster = google_container_cluster.admin.name

  node_config {
    service_account = google_service_account.default.email
  }
}