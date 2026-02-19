# resource "aws_instance" "linux" {
#   ami           = "ami-081ac37fe26dacc98"
#   instance_type = "t2.medium"

#   key_name      = "terraform-keypair"

#   vpc_security_group_ids = [aws_security_group.jenkins-nodes-sg.id]

#   tags = {
#     Name = "linux"
#   }
# }

# resource "aws_instance" "windows" {
#   ami           = "ami-07a73e7966fb8ae9d"
#   instance_type = "t3.medium"
 
#   key_name = "terraform-keypair"

#   vpc_security_group_ids = [aws_security_group.jenkins-nodes-sg.id]
#   tags = {
#     Name = "windows"
#   }
# }

# resource "aws_security_group" "jenkins-nodes-sg" {
#   name = "jenkins-nodes-sg"

#   ingress {
#     from_port   = 22
#     to_port     = 22
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   ingress {
#     from_port   = 3389
#     to_port     = 3389
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   egress {
#     from_port       = 0
#     to_port         = 0
#     protocol        = "-1"
#     cidr_blocks     = ["0.0.0.0/0"]
#   }
# }

# output "aws_instance_linux_public_ip" {
#   value = aws_instance.linux.public_ip
# }

# output "aws_instance_windows_public_ip" {
#   value = aws_instance.windows.public_ip
# }