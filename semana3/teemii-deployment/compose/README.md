# Creación del archivo compose 
docker-compose.ymal con los servicios de backend y frontend, además de de la red y el volumen 

# Servicios 

- service:
    - image: imagen que va a descargar  
    - container_name: nombre del contenedor
    - restart: política de reinicio, para este caso unless-stopped, para que se reinicie a menos que se detenga manualmente
    - enviroment: variables que requiere el backend
    - expose: puertos que se declarar para la comunicación
    - volumen: volumen que va a utilizar y su ubicación
    - network: red a la cual pertenece el servicio


# Ejecución 
Para ejecutar el docker compose se ejecuta docker compose up -d o con la extensión de visual 'Containers' hacer click derecho en el archivo compose y ejecutarlo. Al ejecutarlo hace pull de la imágenes si nos las tengo, crea la red, así como el volumen y levanta los contenedores.





