output "instance_id" {
 value = "${google_compute_instance.test.self_link}"
}
output "public_ip" {
 value = "${google_compute_instance.test.public_ip}"
}