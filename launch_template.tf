resource "aws_launch_template" "web_lt" {
  name_prefix   = "web-lt-"
  image_id      = aws_ami_from_instance.web_ami.id
  instance_type = var.instance_type

  network_interfaces {
    associate_public_ip_address = true
    security_groups             = [aws_security_group.instance_sg.id]
  }

  lifecycle {
    create_before_destroy = true
  }
}