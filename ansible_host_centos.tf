resource "aws_instance" "ansible_host_centos" {
  ami           = "ami-08a6a10bf8d4b5891"
  instance_type = "t2.medium"

  key_name               = "aws-keypair"
  vpc_security_group_ids = [aws_security_group.ansible_host_centos_sg.id]
  tags = {
    Name        = "ansible_host_centos"
    Environment = "test"
  }
}

resource "aws_security_group" "ansible_host_centos_sg" {
  name        = "ansible_host_centos-sg"
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
