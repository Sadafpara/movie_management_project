#Downloading information about the existing resources. 


#Gathering information about the existing VPC of Talent-Academy Lab account,
#We are using VPC name instead of VPC_ID because 
#if the vpc get destroyed or you have a new 
#client ID always changes but we can use he same name again 

data "aws_vpc" "vpc" {
  #id = var.vpc_id
  filter {
    name   = "tag:Name"
    values = [var.vpc_name]
  }
}


#Public Subnet
data "aws_subnet" "public_subnet_a" {
  filter {
    name   = "tag:Name"
    values = [var.public_subnet_a_name]
  }
}



#Collecting AMI ids for AMAZON LINUX from previousely deployed vpc.
#again not going to use the id. 
data "aws_ami" "amz_linux_image" {
  most_recent = true
  owners      = [var.amz_linux_image_owner]
  filter {
    name   = "name"
    values = [var.amz_linux_image_name]
  }
}

