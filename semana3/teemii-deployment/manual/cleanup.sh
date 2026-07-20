#!/usr/bin/env bash

set -Eeuo pipefail

echo "Eliminando contenedores..."
docker rm -f teemii-frontend teemii-backend 2>/dev/null || true

echo "Eliminando red..."
docker network rm teemii-network 2>/dev/null || true

if [[ "${1:-}" == "--volumes" ]]; then
  echo "Eliminando volumen y datos persistentes..."
  docker volume rm teemii-data 2>/dev/null || true
else
  echo "El volumen teemii-data se conservará."
  echo "Use ./cleanup.sh --volumes para eliminarlo."
fi

echo "Limpieza terminada."