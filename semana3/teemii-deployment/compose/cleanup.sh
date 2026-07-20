#!/usr/bin/env bash

set -Eeuo pipefail

if [[ "${1:-}" == "--volumes" ]]; then
  echo "Eliminando contenedores, red, volumen y datos..."
  docker compose down --volumes --remove-orphans
else
  echo "Eliminando contenedores y red..."
  docker compose down --remove-orphans
  echo "El volumen teemii-data se conservará."
  echo "Use ./cleanup.sh --volumes para eliminarlo."
fi

echo "Limpieza terminada."