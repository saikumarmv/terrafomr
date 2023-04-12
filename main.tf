#setting-up provider

provider "aws" {
  region = "us-east-1"
}

# write the ec2 instance config 
resource "aws_instance" "ec2_public" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  key_name                    = var.key_name
  security_groups             = ["${aws_security_group.sai-ssh-security-group.id}"]
  subnet_id                   = aws_subnet.public-subnet-1.id
  associate_public_ip_address = true
  lifecycle {
    create_before_destroy = true
  }
  tags = {
    Name = "sai-ec2-Public"
  }
}