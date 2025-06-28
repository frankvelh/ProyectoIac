#ec2
resource "aws_instance" "app_server" {
  ami                    = "ami-058a8a5ab36292159" # Amazon Linux 2
  instance_type          = var.instance_type
  key_name               = aws_key_pair.hotel_project.key_name
  vpc_security_group_ids = [aws_security_group.web_sg.id]
  iam_instance_profile   = aws_iam_instance_profile.backend_profile.name

 user_data = var.ec2_user_data

  #user_data = <<-EOF
    #!/bin/bash
   # yum update -y
   # amazon-linux-extras install docker -y
   # service docker start
   # usermod -a -G docker ec2-user
   # yum install -y awscli
   # aws ecr get-login-password --region us-east-2 | docker login --username AWS --password-stdin ${aws_ecr_repository.backend.repository_url}
   # docker run -d -p 8080:8080 ${aws_ecr_repository.backend.repository_url}:latest
  #EOF
tags = {
    Name = "HotelAppEC2"
  }
  root_block_device {
    volume_size = 20
    volume_type = "gp3"
    encrypted   = true
  }

  metadata_options {
    http_endpoint = "enabled"
    http_tokens   = "required"
  }



  depends_on = [
    aws_ecr_repository.backend,
    aws_ecr_repository.frontend
  ]
}

