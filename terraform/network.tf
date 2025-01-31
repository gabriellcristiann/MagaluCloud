resource "mgc_network_public_ips" "this" {
  description = "test public ip"
  vpc_id      = "23723ac7-6318-4b52-9b27-da0d4125223c"
}

resource "mgc_network_public_ips_attach" "this" {
  public_ip_id = mgc_network_public_ips.this.id
  interface_id = mgc_virtual_machine_instances.this.network_interfaces[0].id
}