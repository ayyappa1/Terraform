# Terraform code to create ec2 instance
variable "AWS_ACCESS_KEY" {
  default = "AKIAJGCYZWZB47MSTXIA"
}

variable "AWS_SECRET_KEY" {
  default = "3EanxKiBPaYpVfDbEptCEda+FYlrYSi5wWzpXG8K"
}

provider "aws"{
  access_key = "${var.AWS_ACCESS_KEY}"
  secret_key = "${var.AWS_SECRET_KEY}"
  region = "ap-south-1"
}

resource "aws_key_pair" "ayyappakp1" {
  key_name   = "ayyappakp1"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC50Qn+noe0x6293LpZCiohvQf15cZIVm+wx/Kptb8QXjp41WkMayFMCUDaTa+pmyrXkT+NXznj7euJvsm/PBJw8OsZQzDafecVO+jgcY8pf7z+xEpYlthx1hdU9CZPRJWmUKzOYWycdtGqcdLAYTV0iJ+jOgEbD5XTQQER2yWsW/OQNxOTjW+Rx/xYzuDVxyx95pYY0PPTwfbiPpB0VqFEfIACphf9yl0ekP+bw/ZL5mc3l0DRZtxT+rMOvAhkbMY2+w5x8mpVNTMOVlxSnBYxAR2E9ew0eYgZUwPoySpzCgF9EVkLxyARxJtl1jPy6kGoKs0SHCF2EIBVUIuRchVR Ayyappa.Boligala@LTPCHE032264372"
}

resource "aws_instance" "terraform_ec2"{
  ami = "ami-0189d76e"
  instance_type = "t2.micro"
  key_name = "${aws_key_pair.ayyappakp1.key_name}"

  tags{
    Name = "Terraform-Test"
  } 
}
