ec2_ami           = "ami-00b1c9efd33fda707"
sg_name = "from_terraform_allow_ssh_http"
ec2_key_name      = "newkey"
ec2_instance_type = "t2.micro"
default_tags = {
  "Name"        = "Development Application Server"
  "Environment" = "Dev"
  "Can Destroy" = "Yes"
  "Owner"       = "Mark Finch"
}