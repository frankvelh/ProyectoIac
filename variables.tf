####### Variables #######
# Región de AWS donde se desplegarán los recursos
variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-2"
}

# Nombre del bucket S3 para almacenar objetos
variable "bucket_name" {
  description = "S3 bucket name"
  type        = string
}


# Tipo de instancia para el servidor EC2 (web)
variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

# Nombre de la Instancia 
variable "instance_name" {
    description = "Instance Name"
    type = string
    default = "mi instancia uno"
  
}

variable "key_pair" {
    description = "Key Pair"
    type = string
    default = "keypair"
  
}

#sudo amazon-linux-extras install docker -y
variable "ec2_user_data" {
    description = "User data scrip for EC2"
    type = string
    default = <<EOF
    #!/bin/bash
    sudo amazon-linux-extras install docker -y
    sudo service docker start
    sudo wget https://go.dev/dl/gol.20.2.linux-amd64.tar.gz
    sudo rm -r /usr/local/go && sudo tar-C /usr/local -xzf gol.20.2.linux-amd64.tar.gz
    EOF   

    
}
#
variable "aws_instance" {
  description = "Tipo de instancia EC2"
  type        = string
  default     = "t2.micro"
}
# Nombre de usuario para la base de datos RDS
variable "db_username" {
  description = "RDS DB username"
  type        = string
}

# Contraseña para la base de datos
variable "db_password" {
  description = "RDS DB password"
  type        = string
  sensitive   = true
}

# Nombre de la base de datos
variable "db_name" {
  description = "Database name"
  type        = string
}

# Nombre del par de claves SSH para acceso a la instancia
variable "key_name" {
  description = "SSH key pair name"
  type        = string
}

# Email verificado para enviar correos usando Amazon SES
variable "ses_email" {
  description = "Verified SES email"
  type        = string
}

# ID de la VPC donde se desplegarán los recursos
variable "vpc_id" {
  description = "VPC ID"
  type        = string
}
