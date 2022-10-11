# DEFINE VARIABLES

variable "vpc_name" {
  description = "The name of the VPC"
  type        = string
}


variable "public_subnet_a_name" {
  description = "The name of the Public Subnet A"
  type        = string
}

variable "amz_linux_image_name" {
  description = "The name of the ami"
  type        = string
}



variable "amz_linux_image_owner" {
  description = "The owner id of the ami"
  type        = string

}


variable "movie_app_ec2_type" {
  description = "The type of the EC2 instance for movie app"
  type        = string

}

variable "keypair_name" {}
# description and type are optional