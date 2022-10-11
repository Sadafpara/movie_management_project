# Same backend (tf-lab-week2-vpc repository), different key

terraform {
  backend "s3" {
    bucket         = "ta-terraform-tfstates-923372466541"
    key            = "projects/movie-management/ec2/terraform.tfstates"
    dynamodb_table = "terraform-lock"
  }
}