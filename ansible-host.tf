resource "aws_instance" "amazon_linux" {
  ami           = "ami-0320940581663281e"
  instance_type = "t2.medium"

  key_name = "aws-keypair"

  vpc_security_group_ids = [aws_security_group.amazon_linux_sg.id]

  tags = {
    Name = "ansible-host"
  }

  root_block_device {
    volume_size = 20
    volume_type = "gp2"
  }
}


resource "aws_security_group" "amazon_linux_sg" {
  name = "amazon-linux-sg"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 9990
    to_port     = 9990
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

output "amazon_linux_public_ip" {
  value = aws_instance.amazon_linux.public_ip
}
