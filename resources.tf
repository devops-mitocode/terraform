# resource "aws_instance" "debian" {
#   ami           = "ami-0c2272b2da6755fab"
#   instance_type = "t2.micro"
#   key_name      = "aws-keypair"

#   tags = {
#     Name        = "debian"
#     Environment = "calidad"
#   }
# }

# resource "aws_instance" "windows" {
#   ami                    = "ami-07e278fe6c43b6aba"
#   instance_type          = "t2.micro"
#   key_name               = "aws-keypair"
#   tags = {
#     Name = "windows"
#   }
# }

resource "aws_instance" "centos" {
  ami           = "ami-070c0059c28d778a6"
  instance_type = "t2.micro"
  key_name      = "aws-keypair"

  tags = {
    Name        = "centos"
  }
}
