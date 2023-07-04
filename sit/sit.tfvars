ec2_ami           = "ami-00b1c9efd33fda707"
sg_name = "prod_terraform_allow_ssh_http"
ec2_key_name      = "newkey"
ec2_instance_type = "t2.micro"

default_tags = {
  "Name"        = "Production Application Server"
  "Environment" = "Dev"
  "Can Destroy" = "No"
  "Owner"       = "Mr. Demon"
}