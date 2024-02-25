resource "aws_instance" "debian" {
  ami           = "ami-0c2644caf041bb6de"
  instance_type = "t2.medium"

  key_name               = "aws-keypair"
  vpc_security_group_ids = [aws_security_group.debian_sg.id]
  tags = {
    Name        = "debian"
    Environment = "test"
  }
}

resource "aws_security_group" "debian_sg" {
  name        = "debian-sg"
  description = "Security group for Jenkins"

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
    from_port   = 2375
    to_port     = 2376
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

output "ec2_instance_ip" {
  value = aws_instance.debian.public_ip
}
