provider "google" {
  project = "predictive-host-401610"
  region  = "us-central1"
  zone    = "us-central1-c"
}

resource "google_storage_bucket" "static-site" {
  name          = "new-bucket-task-6"
  location      = "EU"
  force_destroy = true

  uniform_bucket_level_access = true

  website {
    main_page_suffix = "index.html"
    not_found_page   = "404.html"
  }
 }

resource "google_compute_instance" "dare-id-vm" {
  name         = "dareit-vm-tf-task6"
  machine_type = "e2-medium"
  zone         = "us-central1-a"

  tags = ["dareit"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      labels = {
        managed_by_terraform = "true"
      }
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral public IP
    }
  }
}

resource "google_sql_database_instance" "main" {
  name             = "dareit"
  database_version = "POSTGRES_15"
  region           = "us-central1"

  settings {
    # Second-generation instance tiers are based on the machine
    # type. See argument reference below.
    tier = "db-f1-micro"
  }
}