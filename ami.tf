resource "aws_instance" "web" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = var.instance_type
  user_data     = file("user_data.sh")
  subnet_id     = data.aws_subnets.default.ids[0]
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
  key_name      = aws_key_pair.generated_key.key_name

  tags = {
    Name = "web-ami-instance"
  }
}

resource "aws_ami_from_instance" "web_ami" {
  name               = "web-custom-ami-${formatdate("YYYY-MM-DD-hh-mm-ss", timestamp())}"
  source_instance_id = aws_instance.web.id
  lifecycle {
    create_before_destroy = true
  }
  depends_on = [aws_instance.web]
}

# Create a new SSH key pair
resource "tls_private_key" "my_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "generated_key" {
  key_name   = "ec21-key"
  public_key = tls_private_key.my_key.public_key_openssh
}

# Save the private key to a local file
resource "local_file" "private_key" {
  content         = tls_private_key.my_key.private_key_pem
  filename        = "${path.module}/ec21-key.pem"
  file_permission = "0400"
}