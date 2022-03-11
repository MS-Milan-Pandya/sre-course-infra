data "openstack_compute_keypair_v2" "this" {
  name = var.openstack_compute_keypair_v2_name
}

resource "openstack_compute_secgroup_v2" "this" {
  name        = "terraform__security_group"
  description = "security group for terraform instance"
  rule {
    from_port   = 22
    to_port     = 22
    ip_protocol = "tcp"
    cidr        = "0.0.0.0/0"
  }
  rule {
    from_port   = 80
    to_port     = 80
    ip_protocol = "tcp"
    cidr        = "0.0.0.0/0"
  }
  rule {
    from_port   = 443
    to_port     = 443
    ip_protocol = "tcp"
    cidr        = "0.0.0.0/0"
  }
  rule {
    from_port   = -1
    to_port     = -1
    ip_protocol = "icmp"
    cidr        = "0.0.0.0/0"
  }
}

resource "openstack_compute_instance_v2" "ubuntu" {
  name        = "ubuntu"
  image_name  = "Ubuntu-20.04.1-202008"
  flavor_name = var.openstack_compute_instance_v2_flavor_name
  key_pair    = data.openstack_compute_keypair_v2.this.name

  config_drive = true

  security_groups = [
    openstack_compute_secgroup_v2.this.name
  ]
}

resource "openstack_compute_instance_v2" "centos" {
  name        = "centos"
  image_name  = "centos7-dummy-2022-02-02-prod.raw"
  flavor_name = var.openstack_compute_instance_v2_flavor_name
  key_pair    = data.openstack_compute_keypair_v2.this.name

  config_drive = true

  security_groups = [
    openstack_compute_secgroup_v2.this.name
  ]
}
