/*
resource "ah_cloud_server" "client" {
  name                     = "client"
  datacenter               = var.ah_datacenter
  image                    = var.ah_image_type
  product                  = var.ah_server_type
  ssh_keys                 = ["02:84:8c:29:4d:16:10:12:3e:7e:48:fc:d4:46:d8:81"]
  create_public_ip_address = "true"
}
*/

resource "ah_cloud_server" "cluster-node" {
  count                    = 2
  name                     = "cluster-node-${count.index}"
  datacenter               = var.ah_datacenter
  image                    = var.ah_image_type
  product                  = var.ah_server_type
  ssh_keys                 = ["02:84:8c:29:4d:16:10:12:3e:7e:48:fc:d4:46:d8:81"]
  create_public_ip_address = "true"

  /* If you will get error with "local-exec" please uncomment the block "remote-exec" below to make sure that the "local-exec" will reach our newly created VM
  
  provisioner "remote-exec" {
    inline = ["sudo yum update -y"]
  
    connection {
      type = "ssh"
      host = ah_cloud_server.srv-1.ips.0.ip_address
      user = "adminroot"
      private_key = "${file(var.ssh_key_private)}"
    }
  }
  
  provisioner "local-exec" {
    command = "ansible-playbook -u adminroot -i '${ah_cloud_server.srv-1.ips.0.ip_address},' --private-key ${var.ssh_key_private} ansible_provision.yml"
  }

 */

}

### Declare "data-resource"
data "ah_cloud_servers" "all-servers" {}

### Create LAN range for my VMs
resource "ah_private_network" "lan" {
  ip_range = "10.0.0.0/24"
  name     = "LAN for VMs"
  /*depends_on = [
    ah_cloud_server.cluster-node,
  ]*/
}

### Assign IP from LAN range to each cluster-node
resource "ah_private_network_connection" "lan-connect" {
  count              = 2
  cloud_server_id    = ah_cloud_server.cluster-node[count.index].id
  private_network_id = ah_private_network.lan.id
  ip_address         = "10.0.0.${count.index + 1}"
  depends_on = [
    ah_cloud_server.cluster-node,
    ah_private_network.lan
  ]
}

