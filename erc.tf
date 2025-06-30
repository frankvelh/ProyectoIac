#ecr.tf  
#Crear repositorio ECR para backend
resource "aws_ecr_repository" "backend" {
  name = "hotel-backend"
  force_delete = true
}

# Subir imagen con null_resource local-exec
resource "null_resource" "build_backend_image" {
  provisioner "local-exec" {
    command = <<EOT
      aws ecr get-login-password --region ${var.aws_region} | docker login --username AWS --password-stdin ${aws_ecr_repository.backend.repository_url}
      docker build -t hotel-backend ../hotel-app/backend
      docker tag hotel-backend:latest ${aws_ecr_repository.backend.repository_url}:latest
      docker push ${aws_ecr_repository.backend.repository_url}:latest
    EOT
  }

triggers = {
  always_run = "${timestamp()}"
}

  depends_on = [aws_ecr_repository.backend]
}


# === ECR para Frontend ===
resource "aws_ecr_repository" "frontend" {
  name = "hotel-frontend"
  force_delete = true
}

resource "null_resource" "build_frontend_image" {
  provisioner "local-exec" {
    command = <<EOT
      aws ecr get-login-password --region ${var.aws_region} | docker login --username AWS --password-stdin ${aws_ecr_repository.frontend.repository_url}
      docker build -t hotel-frontend ../hotel-app/frontend
      docker tag hotel-frontend:latest ${aws_ecr_repository.frontend.repository_url}:latest
      docker push ${aws_ecr_repository.frontend.repository_url}:latest
    EOT
  }
  depends_on = [aws_ecr_repository.frontend]
}