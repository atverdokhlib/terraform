	

resource "google_compute_instance" "test" {
  name         = "${var.prefix}-vm" // yields "test1", "test2", etc. It's also the machine's name and hostname
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
  metadata {
   sshKeys = "andy:${file(".ssh/id_rsa.pub")}"
 }
metadata_startup_script = <<SCRIPT
sudo apt update
sudo apt install apache2
sudo chmod 777 /var/www/html/index.html
sudo > /var/www/html/index.html
sudo curl ifconfig.co > /var/www/html/index.html
sudo ervice apache restart
SCRIPT
}

