# source rustup .cargo/env if it exists
if [ -d "$HOME/.cargo/env" ] ; then
  . "$HOME/.cargo/env"
fi
