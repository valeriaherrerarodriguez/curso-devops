
## 1. Gestion de usuarios
sudo useradd -d /home/devopslead devopslead
sudo useradd dev1
sudo useradd dev2
sudo useradd intruder

sudo passwd devopslead
sudo passwd dev1
sudo passwd dev2

sudo groupadd release_team
sudo usermod -aG release_team devopslead
sudo usermod -aG release_team dev1
sudo usermod -aG release_team dev2

## 2. Permisos
sudo mkdir -p /srv/releases
sudo chown devopslead:release_team /srv/releases

echo "Release v1.0 - Información secreta ficticia" | sudo tee /srv/releases/release_notes.txt
sudo chown devopslead:release_team /srv/releases/release_notes.txt

sudo chmod 750 /srv/releases
sudo chmod 770 /srv/releases/release_notes.txt

## Prueba
cgi@teletrabajo-valeria:~/curso-devops/semana1/retos$ sudo -u intruder cat /srv/releases/release_notes.txt
cat: /srv/releases/release_notes.txt: Permiso denegado

## 3. Procesos
nano proceso_actualizacion.sh
chmod +x proceso_actualizacion.sh
./proceso_actualizacion.sh &

## Prueba
cgi       514873  0.0  0.0  11916  2456 pts/0    S+   11:43   0:00 grep --color=auto proceso_actualizacion


## access_attempts.log
2026-06-14 12:03:11 - usuario: intruder
2026-06-14 12:08:01 - usuario: intruder
2026-06-14 12:10:01 - usuario: intruder
2026-06-14 12:12:01 - usuario: intruder