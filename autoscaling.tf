resource "aws_autoscaling_group" "web_asg" {
  desired_capacity     = var.asg_desired_capacity
  max_size             = 3
  min_size             = 1
  vpc_zone_identifier  = data.aws_subnet_ids.default.ids

  launch_template {
    id      = aws_launch_template.web_lt.id
    version = "$Latest"
  }

  target_group_arns = [aws_lb_target_group.web_tg.arn]

  tag {
    key                 = "Name"
    value               = "Web-ASG"
    propagate_at_launch = true
  }
}