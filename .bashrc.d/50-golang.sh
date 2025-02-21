# set PATH so it includes user's private Go bin if it exists
if [ -d "$HOME/go/bin" ] ; then
    export PATH="$HOME/go/bin:$PATH"
fi

# set PATH so it includes user's private Go bin if it exists
if [ -d "$HOME/.local/go/bin" ] ; then
    export PATH="$HOME/.local/go/bin:$PATH"
fi
