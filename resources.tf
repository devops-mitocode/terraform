resource "aws_instance" "linux" {
  ami           = "ami-0b5150625de287cb4"
  instance_type = "t2.medium"

  key_name      = "aws-keypair"

  vpc_security_group_ids = [aws_security_group.jenkins-nodes-sg.id]

  tags = {
    Name = "linux"
  }
}


resource "aws_instance" "windows" {
  ami           = "ami-07f134e32cbbbfc98"
  instance_type = "t3.medium"
 
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


output "aws_instance_linux_public_ip" {
  value = aws_instance.linux.public_ip
}


output "aws_instance_windows_public_ip" {
  value = aws_instance.windows.public_ip
}


# resource "aws_instance" "amazon-linux-2" {
#   ami           = "ami-0a94a1259c5779e00"
#   instance_type = "t3.micro"
#   key_name      = "ec2-user"

#   vpc_security_group_ids = [aws_security_group.amazon-linux-sg.id]

#   tags = {
#     Name = "amazon-linux-2"
#   }

#   root_block_device {
#     volume_size = 15
#     volume_type = "gp2"
#   }
# }

# resource "aws_security_group" "amazon-linux-sg" {
#   name = "amazon-linux-sg"

#   ingress {
#     from_port   = 22
#     to_port     = 22
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   ingress {
#     from_port   = 8080
#     to_port     = 8080
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
# }
