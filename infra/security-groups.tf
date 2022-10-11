# Creating new security groups
#Using resources ratther than Data source 
#security groups are going to be attached to the movie application.
#https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group

resource "aws_security_group" "movie_app_sg" {
  name        = "movie-app-sg"
  description = "SG for Movie Mgmt Application"
  vpc_id      = data.aws_vpc.vpc.id
  #using the information which the data source has downloaded about the existing vpc

#INBOUND
  ingress {
    description = "Access to our Flask app"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }

 ingress {
    description = "SSH connection into the server"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }

#OUTBOUND
  egress {
    description = "Access to the internet"
    from_port   = 0
    to_port     = 0
    protocol    = "-1" #BOTH TCP and UDP.
    cidr_blocks = ["0.0.0.0/0"]

  }

  tags = {
    Name = "movie-app-sg"
  }
}
