resource "aws_instance" "centos" {
  ami           = "ami-043d15fdde2ef3fe5"
  instance_type = "t2.micro"
  key_name      = "aws-keypair"

  tags = {
    Name = "centos"
  }
}