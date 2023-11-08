data "aws_region" "current" {}

data "aws_vpc_ipam_pool" "test" {
  filter { 
    name   = "tag:Name"
    values = ["Test Pool"]
  }
}

resource "aws_vpc" "test" {
  ipv4_ipam_pool_id   = data.aws_vpc_ipam_pool.test.id
  ipv4_netmask_length = 28
}

output "pool_id" {
  description = "Pool ID"
  value       = data.aws_vpc_ipam_pool.test.id
}
