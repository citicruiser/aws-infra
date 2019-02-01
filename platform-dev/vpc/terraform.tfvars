
#AWS env
app_env = "platform1"
allowed_account_ids = ["048199071553"]
shared_credentials_file = "C:\\Users\\pwang\\.aws\\config"
profile = "wqpt-platform-dev"
//project = ""

#VPC
name = "vpc-platform-dev"
cidr= "10.103.0.0/16"
azs  = ["us-east-1a", "us-east-1b"]

#Subnets
public_subnets = ["10.103.1.0/24", "10.103.2.0/24"]

#Data1 is internal with Internet
data1_subnets = ["10.103.3.0/24", "10.103.4.0/24"]
#Data2 is internal without Internet Access
data2_subnets = ["10.103.5.0/24", "10.103.6.0/24"]

#Web1, Web2, and data1 are internal, but with egress internet access
web1_subnets = ["10.103.16.0/20", "10.103.32.0/20"]
web2_subnets = ["10.103.48.0/20", "10.103.64.0/20"]


#VPC Settings
assign_generated_ipv6_cidr_block = "false"
//enable_nat_gateway = "true"
//single_nat_gateway = "true"
//enable_dns_hostnames = "true"
//enable_dns_support = "true"
