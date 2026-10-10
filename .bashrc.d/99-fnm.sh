# set PATH so it includes user's private fnm bin if it exists
if [ -d "$HOME/.local/share/fnm" ] ; then
    export PATH="$HOME/.local/share/fnm:$PATH"
fi

# set up shell to use fast node manager
# (see: https://github.com/Schniz/fnm)
if command -v fnm &> /dev/null ; then
    eval "$(fnm env --use-on-cd)"
fi
