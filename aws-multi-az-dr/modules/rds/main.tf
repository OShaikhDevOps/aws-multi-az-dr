variable "engine" {
  description = "RDS engine"
  type = string
  default = "postgres"
}

variable "instance_class" {
  type = string
  default = "db.t3.medium"
}

resource "aws_db_subnet_group" "this" {
  name       = "${terraform.workspace}-db-subnet-group"
  subnet_ids = [] # fill with private subnet ids from network module
}

resource "aws_db_instance" "this" {
  allocated_storage    = 20
  engine               = var.engine
  instance_class       = var.instance_class
  identifier           = "${terraform.workspace}-rds"
  db_name              = "demo_db"
  username             = "dbadmin"
  password             = "change-me"
  # parameter_group_name = "default.${var.engine}"
  multi_az             = true
  skip_final_snapshot  = true
  # subnet_group_name = aws_db_subnet_group.this.name
  tags = { Name = "${terraform.workspace}-rds" }
}

output "rds_endpoint" {
  value = aws_db_instance.this.address
}
