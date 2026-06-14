#!/bin/bash

while true
do
	echo "Actualización automática: $(date)" >> /srv/releases/release_notes.txt
	sleep 30 
done

