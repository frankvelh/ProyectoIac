
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




# Compilar el backend (Spring Boot):
./mvnw clean package -DskipTests
# Compilar el frontend (React/Angular)
npm install
npm run build
# Costruir las imagenes:
docker-compose build --no-cache
# bajar los servicios 
docker-compose down
# Levantar la aplicación:
docker-compose up -d

# Actualiza accesos de aws:
. .\env.ps1


terraform apply -auto-approve

ejecutar:
. .\env.ps1
docker build -t hotel-backend .
docker build -t hotel-frontend .

docker images
terraform apply -auto-approve

Backend
$ECR_PW = aws ecr get-login-password --region us-east-2
docker tag hotel-backend:latest 932119507588.dkr.ecr.us-east-2.amazonaws.com/hotel-backend:latest
docker push 932119507588.dkr.ecr.us-east-2.amazonaws.com/hotel-backend:latest

Frontend

docker tag hotel-frontend:latest 932119507588.dkr.ecr.us-east-2.amazonaws.com/hotel-frontend:latest
docker push 932119507588.dkr.ecr.us-east-2.amazonaws.com/hotel-frontend:latest

docker con terraform



Para tener docker funcionando debes instalar docker engine y luego usar los comandos siguientes primero build para crear la imagen y luego run para correr

docker build -t hotel-backend:latest -f Dockerfile .


comando para compilar el docker
docker build -t hotel-devinfra -f Dockerfile .
docker build -t hotel-devinfra -f Dockerfile .
recostrir sin la cahe
docker build --no-cache -t hotel-devinfra -f Dockerfile .


comandos para ejecutar
docker run -it -v ${ruta}:/infra -e AWS_ACCESS_KEY_ID=${ASIA5SBVG6KCGBRIAXMW} -e AWS_SECRET_ACCESS_KEY=${IuXzld5+SWZF4wHagS2+uZXe5i0RXwTz1jLCxkEw} terraform init
# Comando base
$base = "docker run -it --rm -v `"$pwd`":/infra -w /infra -e AWS_ACCESS_KEY_ID=$env:AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY=$env:AWS_SECRET_ACCESS_KEY $image" no usar


Elecutar infra.ps1
$env:AWS_ACCESS_KEY_ID = "TU_ACCESS_KEY"
$env:AWS_SECRET_ACCESS_KEY = "TU_SECRET_KEY"

Paso 2: Ejecuta el script con el comando deseado
.\infra.ps1 init
.\infra.ps1 plan
.\infra.ps1 apply
.\infra.ps1 destroy


<!> listo

SET AWS_ACCESS_KEY_ID=ASIA5SBVG6KCGBRIAXMW
SET AWS_SECRET_ACCESS_KEY=IuXzld5+SWZF4wHagS2+uZXe5i0RXwTz1jLCxkEw