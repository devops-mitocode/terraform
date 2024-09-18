resource "aws_instance" "web" {
  ami           = "ami-03e383d33727f4804"
  instance_type = "t3.micro"

  key_name = "aws-keypair"

  tags = {
    Name = "HelloWorld"
  }
}