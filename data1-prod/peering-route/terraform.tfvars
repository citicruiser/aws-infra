
#AWS env
app_env = "prod"
allowed_account_ids = ["187577432528"]
shared_credentials_file = "C:\\Users\\pwang\\.aws\\config"
profile = "wqpt-data1-prod"
terraformstate = "data1-terraformstate-prod-wqpt"

#VPC Peering ID & Destination CIDR
vpc_peering_connection_id = ["pcx-061f101fd2dfa2db3"]  //vpc peering id
destination_cidr_block =["10.100.0.0/16"]  //CIDR for Corp VPC
