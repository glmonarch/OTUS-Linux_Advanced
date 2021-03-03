/*

### List all public IPs for all created VMs

output "Public IP addresses of created VMs: " {
  value = ah_cloud_server.cluster-node.*.ips.0.ip_address
}

output "public_ip_address_cluster-node-0" {
  value = ah_cloud_server.cluster-node[0].ips.*.ip_address
}

output "public_ip_address_cluster-node-1" {
  value = ah_cloud_server.cluster-node[1].ips.*.ip_address
}

output "public_ip_address_cluster-node-2" {
  value = ah_cloud_server.cluster-node[2].ips.*.ip_address
}

*/

