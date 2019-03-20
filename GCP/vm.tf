	

resource "google_compute_instance" "test" {
  count        = 1 // Adjust as desired
  name         = "test${count.index + 1}" // yields "test1", "test2", etc. It's also the machine's name and hostname
  machine_type = "f1-micro" // smallest (CPU &amp; RAM) available instance
  zone         = "${var.zone}" // yields "europe-west1-d" as setup previously. Places your VM in Europe
 
  boot_disk {
      initialize_params {

        image = "ubuntu-1604-xenial-v20170328" // the operative system (and Linux flavour) that your machine will run
      }  
  }
 
  network_interface {
    network = "default"
    access_config {
      // Ephemeral IP - leaving this block empty will generate a new external IP and assign it to the machine
    }
  }
}

