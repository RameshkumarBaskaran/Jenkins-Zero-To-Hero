provider "google" {
  project     = "airy-rock-378805"
  region      = "us-central1"
  zone        = "us-central1-a"
  credentials = file("gcp-key.json")
}

resource "google_compute_instance" "jenkins_vm" {
  name         = "jenkins-vm"
  machine_type = "e2-micro"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }
}
