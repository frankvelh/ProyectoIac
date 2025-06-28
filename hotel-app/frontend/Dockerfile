# Etapa 1: build
FROM node:18 AS build

WORKDIR /app

# Copiar solo los archivos de dependencias primero
COPY package*.json ./

# Instalar todas las dependencias
RUN npm install

# Copiar el resto de archivos del frontend
COPY . .

# Construir la aplicación
RUN npm run build

# Etapa 2: imagen de producción
FROM nginx:alpine

# Copiar los archivos construidos al directorio de Nginx
COPY --from=build /app/build /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
