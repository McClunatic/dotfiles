#!/bin/sh

# Clone dotfiles repo
if [[ ! -d $HOME/codes/.dotfiles ]]
then
    git clone --bare git@github.com:McClunatic/dotfiles.git $HOME/codes/.dotfiles
fi

# Checkout the dotfiles
alias dotfiles='git --git-dir $HOME/codes/.dotfiles --work-tree $HOME'
dotfiles checkout
if [[ $? -eq 1 ]]
then
    # Back up conflicting dotfiles before retrying on error
    mkdir -p $HOME/.dotfiles-backup
    dotfiles checkout |& grep -E '^\s+' | xargs -I{} mv {} $HOME/.dotfiles-backup/{} 
    dotfiles checkout
fi

# Ignore untracked files
dotfiles config --local status.showUntrackedFiles no
