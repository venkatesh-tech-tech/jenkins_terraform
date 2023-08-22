provider "aws" {
    region = "us-west-1"  
}

resource "aws_instance" "foo" {
  ami           = "ami-0f8e81a3da6e2510a" # us-west-1
  instance_type = "t2.micro"
  tags = {
      Name = "TF-Instance"
  }
