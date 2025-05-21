variable "aws_region" {
  default = "us-east-1"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "ami_name" {
  default = "webserver-ami"
}

variable "asg_desired_capacity" {
  default = 2
}