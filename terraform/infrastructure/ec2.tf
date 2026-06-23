resource "aws_key_pair" "project_key" {
  key_name   = "argocd-project-key-pair"
  public_key = file("${path.module}/argocd-project-key-pair.pub")
}

resource "aws_instance" "my_nginx_app_server" {

  ami           = "ami-091138d0f0d41ff90"
  instance_type = var.instance_type

  key_name = aws_key_pair.project_key.key_name

  vpc_security_group_ids = [
    aws_security_group.project_sg.id
  ]

  root_block_device {
    volume_size = 30
    volume_type = "gp3"
  }

  tags = {
    Name        = "my-nginx-app-server"
    Project     = "argocd-project"
    Environment = "dev"
    Owner       = var.owner
  }
}