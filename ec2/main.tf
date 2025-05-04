resource "aws_instance" "web" {
  ami                    = "ami-04f7a54071e74f488"
  instance_type          = "t2.micro"
  subnet_id              = var.public_subnet_id
  vpc_security_group_ids = [var.web_sg_id]
  key_name               = "maheshtravelmemory-key"

  tags = {
    Name = "web-server"
  }
}


resource "aws_instance" "db" {
  ami                    = "ami-04f7a54071e74f488"
  instance_type          = "t3.micro"
    subnet_id              = var.private_subnet_id
  vpc_security_group_ids = [var.db_sg_id]
  key_name               = "maheshtravelmemory-key"
  tags = {
    Name = "db-server"
  }
}
