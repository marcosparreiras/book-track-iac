# Bastion Host 
resource "aws_security_group" "bastion_sg" {
  vpc_id = aws_vpc.main.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "bastion-sg"
  }
}

resource "aws_instance" "bastion_host" {
  ami           = "ami-0ebfd941bbafe70c6"
  instance_type = "t3.micro"
  subnet_id     = aws_subnet.public_subnet_1.id
  key_name      = "bastion-host-key-pair"

  security_groups = [aws_security_group.bastion_sg.id]

  user_data = <<-EOF
              #!/bin/bash
              sudo dnf install -y postgresql15
              EOF

  tags = {
    Name = "BastionHost"
  }
}
