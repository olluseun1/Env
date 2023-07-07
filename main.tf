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
  backend "s3" {
    # bucket = "techbleat-terraform-statefile"
    bucket = var.bucket
    # key    = "dev/terraform.tfstate"
    key = var.key
    region = "eu-west-1"
  }
}

provider "aws" {
  #profile = "default" # AWS Credentials Profile configured on your local desktop terminal  $HOME/.aws/credentials
  region  = "eu-west-1"
}