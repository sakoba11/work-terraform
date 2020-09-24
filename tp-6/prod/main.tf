provider "aws" {
  region     = "us-east-1"
  access_key = "PUT YOUR OWN"
  secret_key = "PUT YOUR OWN"
}

terraform {
  backend "s3" {
    bucket = "terraform-backend-thierno"
    key    = "thierno-prod.tfstate"
    region = "us-east-1"
    access_key = "PUT YOUR OWN"
    secret_key = "PUT YOUR OWN"
  }
}

module "ec2" {
  source = "../modules/ec2module"
  instancetype = "t2.micro"
  aws_common_tag = {
    Name = "ec2-prod-thierno"
  }
  sg_name = "prod-thierno-sg"
}
