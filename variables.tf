variable "region" {
  description = "Primary AWS region"
  type        = string
  default     = "us-east-1"
}

variable "secondary_region" {
  description = "Secondary region for replication (S3 cross-region, etc.)"
  type        = string
  default     = "us-east-2"
}

variable "env" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

variable "vpc_cidr" {
  description = "VPC CIDR block"
  type        = string
  default     = "10.0.0.0/16"
}

variable "azs" {
  description = "Availability zones to use (subset)"
  type        = list(string)
  default     = ["a","b","c"]
}

variable "rds_engine" {
  description = "RDS engine name (postgres, mysql)"
  type        = string
  default     = "postgres"
}
