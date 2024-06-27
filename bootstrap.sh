#!/usr/bin/env bash

# Clone dotfiles repo
if [[ ! -d $HOME/.dotfiles ]]
then
    echo 'cloning dotfiles...'
    git clone --bare git@github.com:McClunatic/dotfiles.git $HOME/.dotfiles
fi

# Checkout the dotfiles
echo 'attempting to checkout dotfiles to $HOME...'
git --git-dir $HOME/.dotfiles --work-tree $HOME checkout 2> /dev/null
if [[ $? -eq 1 ]]
then
    # Back up conflicting dotfiles before retrying on error
    echo 'encountered conflicts, backing up files in $HOME/.dotfiles-backup...'
    mkdir -p $HOME/.dotfiles-backup
    git --git-dir $HOME/.dotfiles --work-tree $HOME checkout |& \
        grep -E '^\s+' | awk '{print $1}' | cut -d/ -f1 | uniq | \
        xargs -I{} mv {} $HOME/.dotfiles-backup/{} 
    echo 'checking out dotfiles to $HOME...'
    git --git-dir $HOME/.dotfiles --work-tree $HOME checkout
fi
echo 'success!'

# Ignore untracked files
echo 'disabling dotfiles status display of untracked files...'
git --git-dir $HOME/.dotfiles --work-tree $HOME config --local status.showUntrackedFiles no
echo 'complete!'
