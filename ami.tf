resource "aws_instance" "web" {
  ami                         = "ami-0c55b159cbfafe1f0"  # Amazon Linux 2
  instance_type               = var.instance_type
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.instance_sg.id]

  user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo yum install -y httpd
              echo "Hello from AMI Web Server!" > /var/www/html/index.html
              sudo systemctl enable httpd
              sudo systemctl start httpd
              EOF

  tags = {
    Name = "AMI-Web-Builder"
  }
}

resource "aws_ami_from_instance" "web_ami" {
  name               = var.ami_name
  source_instance_id = aws_instance.web.id
  depends_on         = [aws_instance.web]
}