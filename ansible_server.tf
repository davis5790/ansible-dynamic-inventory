
resource "aws_instance" "ansible-server" {
  ami                         = "ami-0557a15b87f6559cf"
  instance_type               = "t2.micro"
  key_name                    = "Ansible-key"
  vpc_security_group_ids      = [aws_security_group.ansible-sg.id]
  associate_public_ip_address = true
  tags = {
    Name = "Ansible-Server"
  }
}

resource "aws_security_group" "ansible-sg" {
  name        = "ansible-sg"
  description = "Allow SSH traffic on port 22"

  ingress {
    description = "SSH from my IP"
    from_port   = 22
    to_port     = 22
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}