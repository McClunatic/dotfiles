# set up shell to use fast node manager
# (see: https://github.com/Schniz/fnm)
if command -v fnm &> /dev/null ; then
    eval "$(fnm env --use-on-cd)"
fi
