# define function for window title
function set_win_title() {
    echo -ne "\033]0;$(whoami)@$(hostname):$(pwd) \007"
}

# set up shell to use starship prompt (see https://starship.rs)
if command -v starship &> /dev/null ; then
    starship_precmd_user_func="set_win_title"
    eval "$(starship init bash)"
fi
