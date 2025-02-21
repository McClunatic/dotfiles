# See: https://k3d.io/v5.4.1/usage/advanced/podman/
# Set DOCKER_HOST to point to rootless podman socket
if [ -S "$XDG_RUNTIME_DIR/podman/podman.sock" ] ; then
  export DOCKER_HOST=unix://$XDG_RUNTIME_DIR/podman/podman.sock
fi
