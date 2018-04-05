resource "aws_key_pair" "mykey" {
key_name = "mykey"
public key = "${file("${var.PATH_TO_PUBLIC_key}")}"
}

resource "aws_instance" "rail_app" {
  ami = "${lookup(var.AMIS,var.AWS_REGION)}"
  instance_type = "t2.micro"
  key_name = "${aws_key_pair.mykey.key_name}"
  security_groups = ["${aws_security_group.rails_app}"]
  user_data = "${data.template_file.user_data.rendered}"

connection {
type = "winrm"
user = "${var.INSTANCE_USERNAME}"
private key = "${file(${var.path_to_private_key})}"
}
}

data "template_file" "user_data" {
  template = "${file("${path.module}/run_rails.sh")}"

  vars {
    port = "${var.port}"
  }
}


resource "aws_security_group" "rails_app" {
  name = "${var.name}"
  description = "A Security Group for ${var.name}"

  
  ingress {
    from_port = "${var.port}"
    to_port = "${var.port}"
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