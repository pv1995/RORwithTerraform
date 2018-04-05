provider "aws" {
access_key = "${var.AWS_ACCESS_KEY}"
secret_key = "${var.AWS_SECRET_KEY}"
region = "${var.AWS_REGION}"
}
module "rails_app" {
  # source can also be a git url
  source = "C:\Users\parthivi varshney\Desktop\rails_app"
  port = 8080
  ami = "${var.ami}"
  key_name = "${var.key_name}"
}