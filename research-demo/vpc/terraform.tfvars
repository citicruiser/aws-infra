
#AWS env
app_env = "research"
allowed_account_ids = ["272841533360"]
shared_credentials_file = "C:\\Users\\pwang\\.aws\\config"
profile = "wqpr-research-demo"
//project = ""

#VPC
name = "vpc-research-demo"
cidr= "10.104.0.0/16"
azs  = ["us-east-1a", "us-east-1b"]

#Subnets
public_subnets = ["10.104.1.0/24", "10.104.2.0/24"]

#Data1 is internal with Internet
data1_subnets = ["10.104.3.0/24", "10.104.4.0/24"]
#Data2 is internal without Internet Access
data2_subnets = ["10.104.5.0/24", "10.104.6.0/24"]

#Web1, Web2, and data1 are internal, but with egress internet access
web1_subnets = ["10.104.16.0/20", "10.104.32.0/20"]
web2_subnets = ["10.104.48.0/20", "10.104.64.0/20"]


#VPC Settings
assign_generated_ipv6_cidr_block = "false"
//enable_nat_gateway = "true"
//single_nat_gateway = "true"
//enable_dns_hostnames = "true"
//enable_dns_support = "true"
