california_cidr = "10.10.0.0/16"
#public_subnet  = "10.10.0.0/24"
#private_subnet = "10.10.1.0/24"
#ambiente_dev = "Desarrollo"
subnets = ["10.10.0.0/24", "10.10.1.0/24"]

tags = {
  "env"         = "california"
  "owner"       = "Diego Rojas"
  "Cloud"       = "AWS"
  "IAC"         = "Terraform"
  "IAC_Version" = "1.9.3"
}

sg_ingress_cidr = "0.0.0.0/0"

ec2_specs = {
  "ami" = "ami-0dd7273bbe2496246"
  "instance_type" = "t2.micro"
}

tags_ec2 = {
  "Name" = "ec2-california"
  "env"         = "california"
  "owner"       = "Diego Rojas"
  "Cloud"       = "AWS"
  "IAC"         = "Terraform"
  "IAC_Version" = "1.9.3"
}
