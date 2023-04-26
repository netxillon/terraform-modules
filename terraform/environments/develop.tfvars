# Project name
org = "deloitte" 

# Project name
project = "sap" 

# Environment name to be prefixed in resource names
environment = "dev" 

# AWS region name to be used for resource provisioning
region = "ap-southeast-2"  

# VPC Internet Facing
main_vpc = "20.0.0.0/16"
workload_subnets  = ["20.0.1.0/24", "20.0.2.0/24"]
public_availability_zones = ["ap-southeast-2a", "ap-southeast-2b"]

# DHCP Uptions for VPC
domain_name          = "sapdemo.com"
domain_name_servers  = ["AmazonProvidedDNS"]
ntp_servers          = ["169.254.169.123"]

#S3 life cycle Policies
expiration_days = 10950
tmp_clean_days = 7
days_to_infreq = 90
days_to_glacier = 180
days_to_deep_achive = 365