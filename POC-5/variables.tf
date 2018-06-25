variable "region" {
  default = "ap-south-1"
}

variable "accesskey" {
  default = "AKIAJ6LP345EW3GJHHIQ"
}

variable "secretkey" {
  default = "8tDIR1LCszlKLY8bnZSJSXK/jb8n1X44bTEkeVLx"
}

variable "imageid" {
  default     = "ami-41e9c52e"
  description = "ubuntu 16 image"
}

variable "instancetype" {
  default = "t2.micro"
}

variable "vpcid" {
  default = "vpc-7f692817"
}

