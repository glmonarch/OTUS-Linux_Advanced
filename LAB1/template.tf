resource "local_file" "AnsibleInventory" {
  content = templatefile("inventory.tpl",
    {
      ip = ah_cloud_server.srv-1.ips.0.ip_address
    }
  )
  filename = "hosts"
}