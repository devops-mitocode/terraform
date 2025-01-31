resource "aws_instance" "linux" {
  ami           = ""
  instance_type = "t2.medium"
  key_name      = "aws-keypair"

  vpc_security_group_ids = [aws_security_group.jenkins-nodes-sg.id]

  tags = {
    Name = "linux"
  }
}

resource "aws_instance" "windows" {
  ami           = ""
  instance_type = "t2.medium"
  key_name = "aws-keypair"

  vpc_security_group_ids = [aws_security_group.jenkins-nodes-sg.id]
  tags = {
    Name = "windows"
    Environment = "qa"
  }
}

resource "aws_security_group" "jenkins-nodes-sg" {
  name = "jenkins-nodes-sg"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
}