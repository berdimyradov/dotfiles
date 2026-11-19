_excalidraw_up() {
  docker info >/dev/null 2>&1 || {
    echo "Start Docker first." >&2
    return 1
  }

  # Pull the latest image before replacing the container.
  docker pull excalidraw/excalidraw:latest || return 1

  if docker container inspect excalidraw >/dev/null 2>&1; then
    docker rm -f excalidraw >/dev/null || return 1
  fi

  docker run -d \
    --name excalidraw \
    --restart unless-stopped \
    -p 127.0.0.1:9999:80 \
    excalidraw/excalidraw:latest >/dev/null || return 1

  echo "Excalidraw: http://localhost:9999"
}
