resource "null_resource" "devops_provisioner" {
  triggers {
    public_ip = "${azurerm_public_ip.pub-ip.ip_address}"
  }

  connection {
    type = "ssh"
    host = "${azurerm_public_ip.pub-ip.ip_address}"
    user = "andy"
    password = "Password1234!"
    
  }

  provisioner "remote-exec" {
     inline = [
      "sudo apt-get update",
      "sudo apt-get install apache2",
      "sudo chmod 777 /var/www/html/index.html",
      "sudo > /var/www/html/index.html",
      "sudo curl ifconfig.co > /var/www/html/index.html"

]
 
 }

}