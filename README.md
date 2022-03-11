# SRE course dev infra

## Description

Dev infrastructure for SRE course homework in VK cloud solution.

## Setup

1. [Download](https://mcs.mail.ru/app/project/keys/) `openrc` file and init.

```sh
source %your_openrc_name%.sh
```
2. Initialize terraform

```sh
terraform init
```

3. Plan infra

```sh
terraform plan
```

4. Provision infra

```sh
terraform apply
```

5. Destroy infra after testing

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
