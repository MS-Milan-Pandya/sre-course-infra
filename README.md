# SRE course dev infra

## Description

Dev infrastructure for SRE course homework in VK cloud solution.

## Setup

1. [Download](https://mcs.mail.ru/app/project/keys/) `openrc` file and init.

```sh
source %your_openrc_name%.sh
```

2. [Add](https://mcs.mail.ru/app/account/key-pairs/) your ssh pubkey to VKS and setup variable in `terraform.tfvars`

```sh
echo 'openstack_compute_keypair_v2_name = "your key pair name"' >> terraform.tfvars
```

3. Initialize terraform

```sh
terraform init
```

4. Plan infra

```sh
terraform plan
```

5. Provision infra

```sh
terraform apply
```

6. Destroy infra after testing

```sh
terraform destroy
```

## For ARM users

### Build Openstack provider for ARM arch

1. Clone Repo

```sh
git clone https://github.com/terraform-provider-openstack/terraform-provider-openstack
```

```sh
cd terraform-provider-openstack
```

2. Build

```sh
go build .
```

3. Copy binary

```sh
cp terraform-provider-openstack ~/.terraform.d/plugins/registry.terraform.io/hashicorp/openstack/1.47.0/darwin_arm64/terraform-provider-openstack_v1.47.0
```
