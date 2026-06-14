RETO CAJA FUERTE DEVOPS

La compañía ficticia CloudCorp tiene un servidor Linux donde se guarda un archivo secreto llamado release_notes.txt con información sensible del próximo despliegue. Solo un usuario especial llamado devopslead puede acceder al archivo.Pero el equipo de desarrollo necesita un script que simule la generación de estos archivos y un proceso que monitoree quién intenta acceder. Tu misión es configurar todo el entorno y hacer que funcione con las reglas de seguridad pedidas

Objetivos del reto

- Gestión de usuarios y grupos
- Permisos
- Procesos
- Bash scripting
- Extra (para subir nota)

Criterios de éxito

- Los permisos están configurados correctamente y intruder no puede leer el archivo.
- El script check_access.sh funciona para usuarios autorizados y no autorizados.
- El proceso de actualización del archivo existe y se puede detectar y modificar con renice.
- El log de accesos no autorizados se registra con fecha, hora y usuario.
- (Extra) El cron job genera entradas automáticas en el log.