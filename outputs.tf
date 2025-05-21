output "alb_dns_name" {
  value = aws_lb.web_alb.dns_name
  description = "ALB DNS name to access the application"
}