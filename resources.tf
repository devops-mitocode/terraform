resource "aws_instance" "amazon-linux" {
  ami           = "ami-0a94a1259c5779e00"
  instance_type = "t3.micro"
  key_name      = "ec2-user"

#   vpc_security_group_ids = [aws_security_group.amazon-linux-sg.id]

  tags = {
    Name = "amazon-linux-2"
  }

  root_block_device {
    volume_size = 20
    volume_type = "gp2"
  }
}
