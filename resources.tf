# resource "aws_instance" "amazon-linux" {
#   ami           = "ami-07b0c09aab6e66ee9"
#   instance_type = "t2.medium"
#   key_name      = "ec2-user"

#   vpc_security_group_ids = [aws_security_group.amazon-linux-sg.id]

#   tags = {
#     Name = "amazon-linux-2"
#   }

#   root_block_device {
#     volume_size = 20
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
