#!/usr/bin/env sh

# Clone dotfiles repo
if [[ ! -d $HOME/.dotfiles ]]
then
    git clone --bare git@github.com:McClunatic/dotfiles.git $HOME/.dotfiles
fi

# Checkout the dotfiles
alias dotfiles='git --git-dir $HOME/.dotfiles --work-tree $HOME'
dotfiles checkout 2> /dev/null
if [[ $? -eq 1 ]]
then
    # Back up conflicting dotfiles before retrying on error
    mkdir -p $HOME/.dotfiles-backup
    dotfiles checkout 2>&1 | grep -E '^\s+' | xargs -I{} mv {} $HOME/.dotfiles-backup/{} 
    dotfiles checkout
fi

# Ignore untracked files
dotfiles config --local status.showUntrackedFiles no
