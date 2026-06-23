output "public_ip" {
  value = aws_instance.my_nginx_app_server.public_ip
}

output "public_dns" {
  value = aws_instance.my_nginx_app_server.public_dns
}