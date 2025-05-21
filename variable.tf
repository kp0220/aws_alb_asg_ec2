variable "region" {
  default = "ap-south-1"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "domain_name" {
  description = "Your custom domain"
  type        = string
}
