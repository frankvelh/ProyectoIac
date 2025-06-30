FROM ubuntu:22.04

# Configuración básica
ENV DEBIAN_FRONTEND=noninteractive
WORKDIR /infra

# Instala herramientas necesarias
RUN apt-get update && apt-get install -y \
  curl \
  gnupg \
  lsb-release \
  wget \
  unzip \
  software-properties-common \
  openjdk-17-jdk \
  git \
  python3-pip \
  postgresql-client

# Instala Node.js 20 (compatible con npm@latest)
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && \
    apt-get install -y nodejs

# === Terraform ===
RUN curl -fsSL https://apt.releases.hashicorp.com/gpg | gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg && \
    echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" \
    > /etc/apt/sources.list.d/hashicorp.list && \
    apt-get update && \
    apt-get install -y terraform

# === Checkov ===
RUN pip3 install checkov --break-system-packages

# === Node setup === (para proyectos con frontend)
RUN npm install -g npm@latest

# === Verifica versiones instaladas ===
RUN java -version && terraform -version && node -v && npm -v && checkov --version && psql --version

# === Variables para Jenkins y AWS CLI (si se desea) ===
ENV AWS_REGION=us-east-2
ENV TF_VAR_db_name=hotel


# Punto de entrada por defecto
CMD ["bash"]
