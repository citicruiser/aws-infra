# VPC
output "vpc_id" {
  description = "The ID of the VPC"
  value       = "${module.vpc.vpc_id}"
}

# CIDR blocks
output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = ["${module.vpc.vpc_cidr_block}"]
}

//output "vpc_ipv6_cidr_block" {
//  description = "The IPv6 CIDR block"
//  value       = ["${module.vpc.vpc_ipv6_cidr_block}"]
//}

# Subnets
output "web1_subnets" {
  description = "List of IDs of private subnets"
  value       = ["${module.vpc.private_subnets}"]
}

output "web2_subnets" {
  description = "List of IDs of private subnets"
  value       = ["${module.vpc.private2_subnets}"]
}

output "data1_subnets" {
  description = "List of IDs of private subnets"
  value       = ["${module.vpc.private2_subnets}"]
}

output "public_subnets" {
  description = "List of IDs of public subnets"
  value       = ["${module.vpc.public_subnets}"]
}

output "data2_subnets" {
  description = "List of IDs of intra subnets"
  value       = ["${module.vpc.intra_subnets}"]
}

# NAT gateways
output "nat_public_ips" {
  description = "List of public Elastic IPs created for AWS NAT Gateway"
  value       = ["${module.vpc.nat_public_ips}"]
}

# AZs
output "azs" {
  description = "A list of availability zones spefified as argument to this module"
  value       = ["${module.vpc.azs}"]
}

#Route Table ID
output "public_route_table_ids" {
  description = "List of IDs of public route table"
  value       = ["${module.vpc.public_route_table_ids}"]
}

output "web_data1_route_table_ids" {
  description = "List of IDs of private route table"
  value       = ["${module.vpc.private_route_table_ids}"]
}

output "data2_route_table_ids" {
  description = "List of IDs of intra route table"
  value       = ["${module.vpc.intra_route_table_ids}"]
}