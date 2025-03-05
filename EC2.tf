# EC2 Instance with Nginx
resource "aws_instance" "nginxserver" {
  ami                    = "ami-04b4f1a9cf54c11d0"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.nginxSG.id]
  associate_public_ip_address = true

  user_data = <<-EOF
            #!/bin/bash
            sudo yum install nginx -y
            sudo systemctl start nginx
            sudo systemctl enable nginx
  EOF

  tags = {
    Name = "myEC2nginxserver"
  }
}
