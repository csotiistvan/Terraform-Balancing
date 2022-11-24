resource "aws_security_group" "generic_server" { # Use your own security group name instead of 'wp-server', refer to this in wp-server.tf
name = "generic-server"
description = "Allow HTTP and SSH traffic"

ingress {
from_port = 80
to_port = 80
protocol = "tcp"
cidr_blocks = ["0.0.0.0/0"]
  }

ingress {
from_port = 22
to_port = 22
protocol = "tcp"
cidr_blocks = ["0.0.0.0/0"]
  }

egress {
from_port = 0
to_port = 0
protocol = "-1"
cidr_blocks = ["0.0.0.0/0"]
  }
}