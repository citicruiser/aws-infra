
#AWS env
app_env = "sbx"
allowed_account_ids = ["464565879112"]
shared_credentials_file = "C:\\Users\\pwang\\.aws\\config"
profile = "wqpr"
project = ""

#VPC
name = "vpc-poc1"
cidr= "10.1.0.0/16"
azs  = ["us-east-1a", "us-east-1b"]

#Subnets
public_subnets = ["10.1.1.0/24", "10.1.2.0/24"]
web1_subnets = ["10.1.3.0/24", "10.1.4.0/24"]
web2_subnets = ["10.1.5.0/24", "10.1.6.0/24"]
data1_subnets = ["10.1.7.0/24", "10.1.8.0/24"]
data2_subnets = ["10.1.9.0/24", "10.1.10.0/24"]

#VPC Settings
assign_generated_ipv6_cidr_block = "false"
//enable_nat_gateway = "true"
//single_nat_gateway = "true"
//enable_dns_hostnames = "true"
//enable_dns_support = "true"
