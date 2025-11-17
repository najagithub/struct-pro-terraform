Ex of 

.tfvars
```
region          = "eu-west-3"
profile         = "default"
environment     = "dev"

# ec2 variable
instance_type   = "t3.micro"
ami          = "ami-0d3684aec6d12c883"
tags            = {
    Project = "TerraformTraining"
    owner   = "Andrianaja"
}

vpc_cidr            = "10.0.0.0/16"
public_subnet_cidr  = "10.0.1.0/24"
private_subnet_cidr = "10.0.3.0/24"

ssh_my_ip = "102.18.147.165/24"
```
