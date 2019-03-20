//provider "google" {
 // credentials = "${file("gcp.json")}"
 // project     = "true-gradient-231516"
 // region      = "europe-west1"
 // zone        = "europe-west1-b"
//}


provider "google" {
  credentials = "${file("gcp.json")}"
  project     = "true-gradient-231516"
  region      = "${var.region}"
}