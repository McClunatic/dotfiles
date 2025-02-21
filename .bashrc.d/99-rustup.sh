# source rustup .cargo/env if it exists
if [ -f "$HOME/.cargo/env" ] ; then
  . "$HOME/.cargo/env"
fi
