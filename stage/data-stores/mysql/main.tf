provider "aws" {
  region = "us-east-1"
}

resource "aws_db_instance" "example" {
  engine = "mysql"
  allocated_storage = "10"
  instance_class = "db.t2.micro"
  name = "example_database"
  username = "admin"
  password = "${var.db_password}"
  snapshot_identifier     = "snapshot_name"
  skip_final_snapshot     = true
}

terraform {
  backend "s3" {
    bucket  = "berchev-terraform-up-and-running-state"
    region  = "us-east-1"
    key     = "stage/data-stores/mysql/terraform.tfstate"
    encrypt = true
  }
}