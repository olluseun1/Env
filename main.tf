module "ec2_module_test" {
 source = "git::https://github.com/olluseun1/codebase.git"
 bucket = var.bucket
 key = var.key
 sg_name = var.sg_name

}

variable bucket {}
variable key {}
variable sg_name {}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
required_version = ">= 1.2.0"
}
  backend "s3" {
    bucket = var.bucket
    #bucket = "techbleat-terraform-statefile"
    key = var.key
    #key    = "dev/terraform.tfstate"
    region = "eu-west-1"
  }

  provider "aws" {
    region = "eu-west-1"
    
  }