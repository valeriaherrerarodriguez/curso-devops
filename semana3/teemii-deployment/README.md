Despliegue de Teemii: con y sin Docker Compose


# Objetivo

Poner en producción la aplicación Teemii (una app web de gestión de colecciones de manga) de dos maneras distintas:
- Manualmente, usando solo los binarios de Docker.
- Automatizada, usando Docker Compose.

# Contexto
Teemii consta de dos partes: 
- Frontend: servido en el puerto 8080 (internamente usa el 80).
- Backend + API + WebSocket: atiende en el puerto 3000 (API REST) y 1555 (Socket.IO).


# Requerimientos explícitos 
- A. Ejecución manual:
    - Crea una red aislada llamada teemii-network (bridge).
    - Crea un volumen nombrado teemii-data.
    - Lanza el backend con su imagen,
        - puerto 3000 y 1555 publicados sólo dentro de la red,
        - volumen teemii-data montado en /data.
    - Lanza el frontend con su imagen,
        - puerto 8080 publicado en el host,
        - variable VITE_APP_TITLE=Teemii,
        - variable VITE_APP_PORT=80.

- B. Ejecución automatizada:
    - Investiga una herramienta que permita describir los pasos anteriores en un archivo declarativo.
    - Crea ese archivo (formato y nombre quedan a su criterio tras la investigación).
    - Con un solo comando levanta la pila completa.
    - Verifica que todo funcione igual que en el punto A.

# Entregables

- README.md por cada método con:
    - Comandos exactos ejecutados.
    - Validaciones funcionales (curl, navegador, logs).

- Comparativa en formato tabla:
    - Ventajas y desventajas de cada enfoque (tiempo, complejidad, reproducibilidad, mantenimiento, CI/CD, etc.).

- (Opcional) 
    - Pequeño “script de limpieza” que elimine contenedores, redes y volúmenes creados.

# Restricciones y buenas prácticas
    - No suban claves ni tokens al repo.
    - Usen nombres descriptivos para contenedores.
    - Documenten cualquier problema de versiones o compatibilidad que encuentren.

# Criterios de evaluación
    - Correctitud: ambos métodos arrancan y sirven la app sin errores.
    - Claridad: documentación reproducible por un tercero.
    - Profundidad del análisis comparativo.
    - Creatividad: scripts extra, health-checks, makefile, etc.

# Pistas (solo si se atascan)
    - docker network create, docker volume create, docker run …
    - ¿Qué es un “docker-compose.yml”?
    - docker-compose up -d

¡Manos a la obra!

