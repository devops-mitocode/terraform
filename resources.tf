resource "aws_instance" "web" {
  ami           = "ami-07b0c09aab6e66ee9"
  instance_type = "t2.medium"
  key_name      = "ec2-user"

  tags = {
    Name = "HelloWorld"
  }

  root_block_device {
    volume_size = 20
    volume_type = "gp2"
  }
}
