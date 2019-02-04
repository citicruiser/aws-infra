
#AWS env
app_env = "corp"
allowed_account_ids = ["255052431419"]
shared_credentials_file = "C:\\Users\\pwang\\.aws\\config"
profile = "wqpt-corp"
terraformstate = "corp-terraformstate-corp-wqpt"

#VPC Peering ID & Destination CIDR
vpc_peering_connection_id = ["pcx-0034de4fa73196c1c","pcx-06b0fa9a2166c8638", "pcx-0a93c88dcfbcf6c67"]  //peering for research-demo, platform-dev, sandbox
destination_cidr_block =["10.104.0.0/16", "10.103.0.0/16", "10.1.0.0/16"]  //CIDR block for research-demo, platform-dev, sandbox
