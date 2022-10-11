# whenever creating a resource it starts with resource{} if 
#downloading information from existing, using data source, it 
#starts with data{}
#https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance#subnet_id



resource "aws_instance" "movie_mgmt_app_server" {
  ami                    = data.aws_ami.amz_linux_image.id
  instance_type          = var.movie_app_ec2_type
  subnet_id              = data.aws_subnet.public_subnet_a.id
  vpc_security_group_ids = [aws_security_group.movie_app_sg.id] #not using security groups from EC2 classic, it's the old version.
  key_name               = var.keypair_name

  tags = {
    Name = "movie-mgmt-server"
  }
}
