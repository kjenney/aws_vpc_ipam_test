# vpc_ipam_test

Provisioning a VPC using an IPAM Pool

Then import the VPC and try to provision

Running `Terraform v1.3.7` and `Terraform AWS Provider v5.24.0`

## Provision

```
terraform init
terraform apply
```
Save `vpc_id` from `Outputs` of apply. Use this in the next step:

`VPC_ID="vpc-122523421532"`

## Test import

```
cd import
terraform init
terraform import aws_vpc.test $VPC_ID
terraform plan
```

Don't apply, refer to the plan, example here:

```
  # aws_vpc.test must be replaced
-/+ resource "aws_vpc" "test" {
      ~ arn                                  = "arn:aws:ec2:us-east-1:161101091064:vpc/vpc-0811a6d672906cfe6" -> (known after apply)
      - assign_generated_ipv6_cidr_block     = false -> null
      ~ cidr_block                           = "172.20.0.0/28" -> (known after apply)
      ~ default_network_acl_id               = "acl-0f2f3a3c06fef68b4" -> (known after apply)
      ~ default_route_table_id               = "rtb-0e32b49fd27dd51da" -> (known after apply)
      ~ default_security_group_id            = "sg-0312d9e8ec677f032" -> (known after apply)
      ~ dhcp_options_id                      = "dopt-5391c82b" -> (known after apply)
      ~ enable_dns_hostnames                 = false -> (known after apply)
      ~ enable_network_address_usage_metrics = false -> (known after apply)
      ~ id                                   = "vpc-0811a6d672906cfe6" -> (known after apply)
      + ipv4_ipam_pool_id                    = "ipam-pool-06fcc2048925bd472" # forces replacement
      + ipv4_netmask_length                  = 28 # forces replacement
      + ipv6_association_id                  = (known after apply)
      + ipv6_cidr_block                      = (known after apply)
      + ipv6_cidr_block_network_border_group = (known after apply)
      - ipv6_netmask_length                  = 0 -> null
      ~ main_route_table_id                  = "rtb-0e32b49fd27dd51da" -> (known after apply)
      ~ owner_id                             = "161101091064" -> (known after apply)
      - tags                                 = {} -> null
      ~ tags_all                             = {} -> (known after apply)
        # (2 unchanged attributes hidden)
    }

Plan: 1 to add, 0 to change, 1 to destroy.

Changes to Outputs:
  + pool_id = "ipam-pool-06fcc2048925bd472"
```


## Cleanup 

```
cd ..
terraform destroy
rm -rf .terraform*
rm -rf terraform*
```