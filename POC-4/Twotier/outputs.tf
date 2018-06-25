output "appserver1ip" {
  value = "${aws_instance.appserver1.public_ip}"
}

output "appserver2ip" {
  value = "${aws_instance.appserver2.public_ip}"
}

