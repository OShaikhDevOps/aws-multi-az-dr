variable "vpc_cidr" {
  description = "VPC CIDR"
  type = string
}

variable "azs" {
  description = "AZ suffixes (e.g. [\"a\",\"b\"])"
  type = list(string)
}

resource "aws_vpc" "this" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "${terraform.workspace}-vpc"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.this.id
  tags = { Name = "${terraform.workspace}-igw" }
}

# Example public subnets across AZs
resource "aws_subnet" "public" {
  for_each = toset(var.azs)
  vpc_id = aws_vpc.this.id
  cidr_block = cidrsubnet(var.vpc_cidr, 8, index(toset(var.azs), each.key))
  availability_zone = "${data.aws_availability_zones.available.names[0]}${each.key}"
  map_public_ip_on_launch = true
  tags = { Name = "${terraform.workspace}-public-${each.key}" }
}

data "aws_availability_zones" "available" {}

output "vpc_id" {
  value = aws_vpc.this.id
}
