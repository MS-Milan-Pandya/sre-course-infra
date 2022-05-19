resource "openstack_compute_keypair_v2" "this" {
  name       = "admin"
  public_key = <<-EOT
    ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDOXNi1fnwNZynxVrOFnVHuNvshQEVdtGFrre3ZL+T4IZ10l8L8Ob8mHbEARCBXxuV5u9Hd+g+SK8/XqvAQUmQsbsjDzC78GHvo/oUqyftW2FpNkyg9Lgf1IqSpS0EFL/Q6YFPCQ7GGJuubsjUkHxu/C4uQobZ6OzO5p4/zU1n6dy7gwAkVskdpmDM6I0KKU1v3j0IXvMoHrLQsWMnUhG54Z5k1NsPWC8MVh/HYfOJTNqW6NGRapsqbHTrUedJZBFNhxaYA1YPeHpTtSWjZGBn6+ABTN/7jKVUlBI/aYJ+b5iTvJ7wTabetCPfkKtn8Y6KpHWy56uKlTw4G1ykVqERRXN5X/2qqlpH7Nohegu3vrJoz/BMKM5bYW7we9YcgGFn5zLx9W24V2nUDqFMFnz0p2Q4FjkZDbbfbmhdc/XU8dwiAJlXPyoWHBkrQrKvws6ebhKLDc9+KEgrVvPPErkdZGL/gpt7R1emZSulsSovK1F7MUivPrL7FqNvZnkEDxZs= a.muradyan@a-muradyan
EOT
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
  key_pair    = openstack_compute_keypair_v2.this.name

  config_drive = true

  security_groups = [
    openstack_compute_secgroup_v2.this.name
  ]
}

resource "openstack_compute_instance_v2" "RHEL" {
  name        = "RHEL"
  image_name  = "AlmaLinux-8.5"
  flavor_name = var.openstack_compute_instance_v2_flavor_name
  key_pair    = openstack_compute_keypair_v2.this.name

  config_drive = true

  security_groups = [
    openstack_compute_secgroup_v2.this.name
  ]
}
