# set HELIX_RUNTIME if hx exists in .cargo
if [ -x "$HOME/.cargo/bin/hx" ] ; then
    export HELIX_RUNTIME="$HOME/source/repos/helix/runtime"
fi
