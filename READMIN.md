## Proyecto IAC - Hotel App
Este proyecto implementa una solución completa para el despliegue automático y escalable de una aplicación de gestión hotelera, utilizando prácticas DevOps modernas con **Terraform**, **Docker**, **Jenkins** y servicios en la nube de **Amazon Web Services (AWS)**.

Descripción General
El sistema se compone de:
- Un backend desarrollado con Spring Boot.
- Un **frontend** (posiblemente en React o Angular).
- Contenedores Docker para cada módulo.
- Orquestación con **Docker Compose**.
- Automatización del pipeline de CI/CD mediante **Jenkins**.
- Despliegue en la nube con **Terraform**, aprovechando servicios de AWS como EC2, S3, SES, CloudFront y CloudWatch.


## Estructura
Trabajo 1/
├── hotel-app/
│   ├── backend/
│   │   └── Dockerfile
│   ├── frontend/
│   │   └── Dockerfile
├── user_data_multi_container.sh
├── main.tf
├── ec2.tf
├── ecr.tf
├── sg.tf
├── iam.tf
├── outputs.tf
├── terraform.tfvars
├── variables.tf
├── hotel-app/
├── infra/
├── jenkinsfile    
└── docker-compose.yml
├── jenkins/
│   ├── Dockerfile
│   ├── install-plugins.sh  
    ├── docker-compose.yaml
│   ├── jenkins.yaml
│   └── plugins.txt          


# Guía de Despliegue
1. Pre-requisitos
- Docker y Docker Compose
- Terraform CLI 
- Jenkins instalado y configurado
- AWS CLI configurado (`aws configure`)
- Java JDK 11+
- Node.js y npm (solo si el frontend se ejecuta en modo dev)

2. Construcción de Imágenes Docker

# Backend
cd hotel-app
docker build -t hotel-backend .
# Frontend
cd ../frontend
docker build -t hotel-frontend .

3. Orquestación Local con Docker Compose
docker-compose up -d
Esto iniciará ambos contenedores y los enlazará para pruebas locales.

4. Despliegue con Terraform en AWS
# Inicializar Terraform
terraform init

# Verificar el plan
terraform plan -var-file="terraform.tfvars"

# Aplicar cambios
terraform apply -var-file="terraform.tfvars"
5. Pipeline CI/CD con Jenkins
•	Jenkinsfile contiene las etapas:
o	Build Docker de backend y frontend
o	Push al registro (ECR o DockerHub)
o	Aplicar Terraform para infraestructura
o	Notificación por correo (vía SES)


# Compilar el backend (Spring Boot):
./mvnw clean package -DskipTests
./mvnw clean package

npm install --save-dev jest jest-junit

# Compilar el frontend (React/Angular)
npm install
npm run build
# Costruir las imagenes:
docker-compose build --no-cache
# bajar los servicios 
docker-compose down
docker-compose down -v
# Levantar la aplicación:
docker-compose up -d
docker-compose up -d --build
# Actualiza accesos de aws:
. .\env.ps1


terraform apply -auto-approve

ejecutar:
. .\env.ps1
docker build -t hotel-backend .
docker build -t hotel-frontend .

docker images
terraform apply -auto-approve