output "url" {
  value = "http://${aws_instance.rails_app.public_ip}:${var.port}"
}