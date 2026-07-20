
# Crear la red que permite a los contenedores conectarse entre si 
docker network create --driver bridge teemii-network

# Verificar que se creó 
docker network ls

# Crear el volumen
docker volume create teemii-data

# Verificar que el volumen se creó 
docker volume ls

# Ejecutar el backend 
docker run -d \
  --name teemii-backend \
  --network teemii-network \
  --expose 3000 \
  --expose 1555 \
  --mount source=teemii-data,target=/data \
  --env EXPRESS_PORT=3000 \
  --env SOCKET_IO_PORT=1555 \
  --restart unless-stopped \
  dokkaner/teemii-backend:latest


  # Ejecutar el front
docker run -d \
  --name teemii-frontend \
  --network teemii-network \
  --publish 8080:80 \
  --env VITE_APP_TITLE=Teemii \
  --env VITE_APP_PORT=80 \
  --restart unless-stopped \
  dokkaner/teemii-frontend:latest  

  # Comprobaciones 


- 820445141a47   dokkaner/teemii-frontend:latest   "/docker-entrypoint.…"   22 seconds ago       Up 22 seconds       0.0.0.0:8080->80/tcp, [::]:8080->80/tcp   teemii-frontend

- bf55fb653902   dokkaner/teemii-backend:latest     "pm2-runtime start s…"   About a minute ago   Up About a minute   1555/tcp, 3000/tcp      teemii-


# Comprobar que el backend no muestra puertos
docker port teemii-backend

# Verificaciones
- teemii-backend (172.18.0.2:1555) open


- curl -I http://localhost:8080

HTTP/1.1 200 OK
Server: nginx/1.24.0
Date: Sun, 19 Jul 2026 23:55:12 GMT
Content-Type: text/html
Content-Length: 606
Last-Modified: Mon, 15 Jan 2024 18:21:50 GMT
Connection: keep-alive
ETag: "65a577be-25e"
Accept-Ranges: bytes