provider "openstack" {
  user_name = "${data.vault_generic_secret.openstack_credentials.data["user_name"]}"
  tenant_name       = "${var.project_name}"
  password     = "${data.vault_generic_secret.openstack_credentials.data["password"]}"
  auth_url   = "${data.vault_generic_secret.openstack_credentials.data["auth_url"]}"
  region   = "${data.vault_generic_secret.openstack_credentials.data["region"]}"
}

resource "openstack_compute_secgroup_v2" "secgroup" {
  name        = "${var.secgroup}"
  description = "a security group"

  rule {
    from_port   = 22
    to_port     = 22
    ip_protocol = "tcp"
    cidr        = "0.0.0.0/0"
  }
}
