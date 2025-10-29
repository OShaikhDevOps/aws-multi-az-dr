region = "us-east-1"
secondary_region = "us-east-2"
env = "dev"
vpc_cidr = "10.0.0.0/16"
# azs should be the short suffixes for the chosen region (e.g. ["a","b","c"]) or full AZ names
azs = ["a","b","c"]
# rds_engine = "postgres"