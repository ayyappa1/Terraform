variable "aws_access_key" {
    default = "*************"
}
variable "aws_secret_key" {
    default = "*************"
}

variable "region" {
    default = "ap-south-1"
}

#creating a new key pair while lauching the instance
#Genearte pub and private key ssh-keygen -f tf-demo

resource "aws_key_pair" "tf-demo" {
  key_name   = "tf-demo"
  public_key = "${file("tf-demo.pub")}"
}

provider "aws" {
  region     = "${var.region}"
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
}

# creating ubuntu machine with nginx webserver
resource "aws_instance" "nginx" {
#    ami = "ami-41e9c52e"
    ami = "ami-5b673c34"
    instance_type = "t2.micro"
    key_name = "${aws_key_pair.tf-demo.key_name}"
#    user_data = "${file("install_nginx.sh")}"
    user_data = "${file("install_httpd.sh")}"

  tags {
	Name = "Terrafrom"
	}

}

output "aws_instance_public_dns" {
    value = "http://${aws_instance.nginx.public_ip}"
}
