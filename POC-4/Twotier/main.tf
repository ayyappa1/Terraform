provider "aws" {
  region     = "${var.region}"
  access_key = "${var.accesskey}"
  secret_key = "${var.secretkey}"
}


resource "aws_key_pair" "tf-demo" {
  key_name   = "tf-demo"
  public_key = "${file("tf-demo.pub")}"
}


resource "aws_security_group" "allow_all" {
  name        = "allow_all"
  description = "Allow all inbound traffic"
  vpc_id      = "${var.vpcid}"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "appserver1" {
  ami             = "${var.imageid}"
  instance_type   = "${var.instancetype}"
  key_name = "${aws_key_pair.tf-demo.key_name}" 
  security_groups = ["${aws_security_group.allow_all.name}"]

  connection {
    user        = "ubuntu"
    private_key = "${file("tf-demo")}"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get install tomcat7 -y",
    ]
  }
}

resource "aws_instance" "appserver2" {
  ami             = "${var.imageid}"
  instance_type   = "${var.instancetype}"
  key_name = "${aws_key_pair.tf-demo.key_name}" 
  security_groups = ["${aws_security_group.allow_all.name}"]

  connection {
    user        = "ubuntu"
    private_key = "${file("tf-demo")}"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get install nginx -y",
    ]
  }
}

