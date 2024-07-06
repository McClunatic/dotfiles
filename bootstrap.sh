#!/usr/bin/env bash

# Clone dotfiles repo
if [[ ! -d $HOME/dotfiles ]]
then
    echo 'cloning dotfiles repository to $HOME...'
    git clone git@github.com:McClunatic/dotfiles.git $HOME/dotfiles
fi

# Stash current files to restore HEAD files
echo 'stashing $HOME working tree files to restore dotfiles...'
git --git-dir $HOME/dotfiles/.git --work-tree $HOME stash

# Source .profile to bootstrap current shell
echo 'sourcing $HOME/.profile to bootstrap current shell...'
. $HOME/.profile

echo 'complete!'
