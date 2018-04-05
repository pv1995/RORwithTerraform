variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}
variable "AWS_REGION" {
 default = "ap-south-1"
}
variable "AMIS" { 
type = "map"
default = {
ap-south-1 = "ami-43d0982c"
us-east-1 = "ami-13be557e"
us-west-1 = "ami-0d729a60"
}
}
variable "port" {
default = 8080
}
variable "PATH_TO_PRIVATE_KEY" {
  default = "mykey"
}
variable "PATH_TO_PUBLIC_KEY" {
  default = "mykey.pub"
}
variable "INSTANCE_USERNAME" {
  default = "Terraform"
}
variable "INSTANCE_PASSWORD" { }