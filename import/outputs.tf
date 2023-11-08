output "pool_id" {
  description = "Pool ID"
  value       = data.aws_vpc_ipam_pool.test.id
}
