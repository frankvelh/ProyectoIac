#!/bin/bash
set -e

AWS_REGION="us-east-2"
AWS_ACCOUNT_ID="932119507588"

# Login en ECR
echo "Haciendo login en AWS ECR..."
aws ecr get-login-password --region $AWS_REGION \
| docker login --username AWS --password-stdin $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com

# === Build imagen backend ===
echo "Construyendo imagen del backend..."
docker build -t hotel-backend:latest -f ../hotel-app/backend/Dockerfile ../hotel-app/backend

echo "Etiquetando imagen backend..."
docker tag hotel-backend:latest $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/hotel-backend:latest

echo "Subiendo imagen backend a ECR..."
docker push $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/hotel-backend:latest

# === Build imagen frontend ===
echo "Construyendo imagen del frontend..."
docker build -t hotel-frontend:latest -f ../hotel-app/frontend/Dockerfile ../hotel-app/frontend

echo "Etiquetando imagen frontend..."
docker tag hotel-frontend:latest $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/hotel-frontend:latest

echo "Subiendo imagen frontend a ECR..."
docker push $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/hotel-frontend:latest

# === (Opcional) Build imagen infra ===
if [[ -f Dockerfile ]]; then
  echo "Construyendo imagen de infraestructura (infra)..."
  docker build -t infra:latest -f Dockerfile .

  echo "Etiquetando imagen infra..."
  docker tag infra:latest $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/infra:latest

  echo "Subiendo imagen infra a ECR..."
  docker push $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/infra:latest
fi

echo "Proceso completado con éxito."
