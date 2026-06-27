Objetivos Claros

- Instalar y configurar el agente de Amplify: Instalar el agente de monitoreo en su servidor Nginx (puede ser una máquina virtual o un entorno local) y conectarlo a su cuenta de Nginx Amplify.

- Crear un panel de control (dashboard): Configurar un dashboard personalizado en Nginx Amplify para monitorear métricas específicas de rendimiento, como:

    - Tasa de solicitudes (requests): Para ver cuántas peticiones recibe el servidor.
    - Tiempos de respuesta (response times): Para identificar latencia.
    - Errores 5xx: Para detectar fallos en el servidor.
    - Uso de CPU y memoria: Para ver el consumo de recursos.

- Identificar un cuello de botella: Introducir un problema de rendimiento de forma controlada (por ejemplo, con una herramienta de stress testing) y usar el dashboard de Amplify para identificar la causa del problema.

- Optimizar la configuración: Realizar una optimización en su configuración de Nginx (por ejemplo, ajustando el número de worker_processes o worker_connections) y verificar en Amplify que la optimización tuvo un impacto positivo en las métricas.


¿Qué se espera?

    - Se espera que demuestren que pueden:
    - Instalar y conectar su servidor a la plataforma de Amplify.
    - Visualizar y entender las métricas mostradas en el panel de control.
    - Identificar el impacto de una carga de trabajo simulada.
    - Aplicar un cambio en la configuración de Nginx para mejorar el rendimiento.
    - Verificar que la optimización resolvió o mitigó el problema.
    - Video explicando desde la instalacion hasta el uso del mismo, enfocarse tambien en la carga de stress, como ayuda Amplify.



Recursos Necesarios
    - Una cuenta gratuita en Nginx Amplify.
    - Un servidor con Nginx instalado (puede ser un contenedor Docker, una máquina virtual o un servidor local).
    - Una herramienta para generar carga o stress testing, como ab (ApacheBench), wrk o siege.