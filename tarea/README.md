TicoMarket DevOps

Proyecto de DevOps donde se despliega una aplicación Flask en AWS usando Terraform, Ansible y Docker.

Levantar el proyecto desde cero

1. Primero entrar a Terraform y crear la infraestructura

- cd terraform

- terraform apply

Terraform crea la instancia EC2 y genera automáticamente el inventario para Ansible.

2. Desplegar la aplicación

- cd ../ansible

- ansible-playbook -i inventory.ini deploy.yml

Ansible instala Docker, copia la aplicación, construye la imagen y ejecuta el contenedor.

3. Probar la aplicación

Abrir en el navegador:

- http://IP_PUBLICA:5000

La aplicación debe mostrar:

CR Bienvenido a TicoMarket

4. Destruir el ambiente cuando termine la prueba:

- cd ../terraform
- terraform destroy 

5. Verificar que todo se destruyó 

- terraform show