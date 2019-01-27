
#AWS env
app_env = "sbx"
allowed_account_ids = ["464565879112"]
shared_credentials_file = "C:\\Users\\pwang\\.aws\\config"
profile = "wqpr-sandbox1"
//project = ""

#VPC
name = "vpc-test1"
cidr= "10.1.0.0/16"
azs  = ["us-east-1a", "us-east-1b"]

#Subnets
public_subnets = ["10.1.1.0/24", "10.1.2.0/24"]

#Data1 is internal with Internet
data1_subnets = ["10.1.3.0/24", "10.1.4.0/24"]
#Data2 is internal without Internet Access
data2_subnets = ["10.1.5.0/24", "10.1.6.0/24"]

#Web1, Web2, and data1 are internal, but with egress internet access
web1_subnets = ["10.1.16.0/20", "10.1.32.0/20"]
web2_subnets = ["10.1.48.0/20", "10.1.64.0/20"]


#VPC Settings
assign_generated_ipv6_cidr_block = "false"
//enable_nat_gateway = "true"
//single_nat_gateway = "true"
//enable_dns_hostnames = "true"
//enable_dns_support = "true"
