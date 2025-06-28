# Ruta base del script
$basePath = $PSScriptRoot
$frontendPath = Join-Path $basePath "hotel-app/frontend"
$buildHostDir = Join-Path $basePath "build"

# Construcción de imagen frontend y generación del build
Write-Host "Construyendo imagen frontend y generando build..."
docker build -t hotel-frontend-image $frontendPath

# Ejecutar contenedor para generar build
$containerId = docker create hotel-frontend-image
docker cp "${containerId}:/app/build" $buildHostDir
docker rm $containerId

# Sincronizar con S3 usando contenedor Docker con AWS CLI
Write-Host "Sincronizando build con S3..."
docker run --rm -v "${buildHostDir}:/infra/build" `
  -e AWS_ACCESS_KEY_ID=$env:AWS_ACCESS_KEY_ID `
  -e AWS_SECRET_ACCESS_KEY=$env:AWS_SECRET_ACCESS_KEY `
  -e AWS_SESSION_TOKEN=$env:AWS_SESSION_TOKEN `
  amazon/aws-cli s3 sync /infra/build s3://hotel-reservas-frontend --delete


# Planificación con Terraform
Write-Host "Ejecutando terraform plan..."
docker run --rm -v "${basePath}:/infra" `
  -w /infra `
  -e AWS_ACCESS_KEY_ID=$env:AWS_ACCESS_KEY_ID `
  -e AWS_SECRET_ACCESS_KEY=$env:AWS_SECRET_ACCESS_KEY `
  -e AWS_SESSION_TOKEN=$env:AWS_SESSION_TOKEN `
  hotel-devinfra terraform plan -var="aws_instance=tipo"

# Aplicación con Terraform
Write-Host "Ejecutando terraform apply..."
docker run --rm -v "${basePath}:/infra" `
  -w /infra `
  -e AWS_ACCESS_KEY_ID=$env:AWS_ACCESS_KEY_ID `
  -e AWS_SECRET_ACCESS_KEY=$env:AWS_SECRET_ACCESS_KEY `
  -e AWS_SESSION_TOKEN=$env:AWS_SESSION_TOKEN `
  hotel-devinfra terraform apply -auto-approve -var="aws_instance=tipo"

Write-Host "`n¡Despliegue completo!"
