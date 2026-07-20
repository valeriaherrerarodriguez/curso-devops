# Comparativa

## Manual
- Tiempo de despliegue mayor, ya que se debe ejecutar varios comandos
- Complejidad aumenta con cada contenedor y configuración específica, más variables, puertos o redes específicas.
- Mayor riesgo de olvidar parámetros.
- Maás riesgo de cometer errores si no se tiene una guía específica o no se entiende la configuración.
- Mantenimiendo compleja si se debe actualizar comanods y documentación.
- Poco práctico al crecer la aplicación. 
- Si no se documenta bien el control de versiones puede no existir de forma clara.

- Permite entender como funciona cada módulo
- Resulta más sencillo identificar donde están los errores debido a que todo se hace paso a paso.
- Una ventaja es que no exige escribir un archivo ymal.

## Compose
- El despliegue de todos los servicios se hace en un solo comando. 
- La configuración queda centralizada. 
- Menor riesgo a los errores por configuración ya que los parámetros o variables están definidos en el archivo ymal
- Mantenimiento más sencillo ya que solo se mofifica un archivo que también puede ser versionado. 

- Centraliza la configuración 
- Permite guardar la infraestructura en un repositorio.
- Es más sencillo compartir el proyecto con otros desarrolladores. 
- La versión de docker compose instalada podría causar que los comandos sean diferentes 

# Resultados

- Inicialmente se hizo una prueba con la versión latest de las imágenes pero se intentó utilizar la versión 0.8.2 y 0.8.1 ya que presenta errores a nivel de backend, no de configuración de docker.
- Otra causa es el uso d vpn y que no logre consumir el api de Manga para la prueba.  