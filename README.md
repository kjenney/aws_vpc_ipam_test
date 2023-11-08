# vpc_ipam_test

Provisioning a VPC using an IPAM Pool

Then import the VPC and try to provision

## Provision

```
terraform init
terraform apply
mv terraform.tfstate* /tmp/
```
Save `vpc_id` from `Outputs` of apply. Use this in the next step:

`VPC_ID="vpc-122523421532"`

## Test import

```
terraform import aws_vpc.test $VPC_ID
terraform apply
```

```
  # aws_vpc.test must be replaced
-/+ resource "aws_vpc" "test" {
      ~ arn                                  = "arn:aws:ec2:us-east-1:161101091064:vpc/vpc-095b0c618c17e0bac" -> (known after apply)
      - assign_generated_ipv6_cidr_block     = false -> null
      ~ cidr_block                           = "172.20.0.0/28" -> (known after apply)
      ~ default_network_acl_id               = "acl-01cd31d8994681473" -> (known after apply)
      ~ default_route_table_id               = "rtb-03929d5d372f7d841" -> (known after apply)
      ~ default_security_group_id            = "sg-0a01f1ce0d0c2448c" -> (known after apply)
      ~ dhcp_options_id                      = "dopt-5391c82b" -> (known after apply)
      ~ enable_dns_hostnames                 = false -> (known after apply)
      ~ enable_network_address_usage_metrics = false -> (known after apply)
      ~ id                                   = "vpc-095b0c618c17e0bac" -> (known after apply)
      + ipv4_ipam_pool_id                    = (known after apply) # forces replacement
      + ipv4_netmask_length                  = 28 # forces replacement
      + ipv6_association_id                  = (known after apply)
      + ipv6_cidr_block                      = (known after apply)
      + ipv6_cidr_block_network_border_group = (known after apply)
      - ipv6_netmask_length                  = 0 -> null
      ~ main_route_table_id                  = "rtb-03929d5d372f7d841" -> (known after apply)
      ~ owner_id                             = "161101091064" -> (known after apply)
      - tags                                 = {} -> null
      ~ tags_all                             = {} -> (known after apply)
        # (2 unchanged attributes hidden)
    }

  # aws_vpc_ipam.test will be created
  + resource "aws_vpc_ipam" "test" {
      + arn                                       = (known after apply)
      + default_resource_discovery_association_id = (known after apply)
      + default_resource_discovery_id             = (known after apply)
      + id                                        = (known after apply)
      + private_default_scope_id                  = (known after apply)
      + public_default_scope_id                   = (known after apply)
      + scope_count                               = (known after apply)
      + tags_all                                  = (known after apply)

      + operating_regions {
          + region_name = "us-east-1"
        }
    }

  # aws_vpc_ipam_pool.test will be created
  + resource "aws_vpc_ipam_pool" "test" {
      + address_family  = "ipv4"
      + arn             = (known after apply)
      + auto_import     = false
      + id              = (known after apply)
      + ipam_scope_id   = (known after apply)
      + ipam_scope_type = (known after apply)
      + locale          = "us-east-1"
      + pool_depth      = (known after apply)
      + state           = (known after apply)
      + tags_all        = (known after apply)
    }

  # aws_vpc_ipam_pool_cidr.test will be created
  + resource "aws_vpc_ipam_pool_cidr" "test" {
      + cidr              = "172.20.0.0/16"
      + id                = (known after apply)
      + ipam_pool_cidr_id = (known after apply)
      + ipam_pool_id      = (known after apply)
    }

Plan: 4 to add, 0 to change, 1 to destroy.
```
