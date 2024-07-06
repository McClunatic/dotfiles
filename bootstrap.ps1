# Clone dotfiles repo
if (!(Test-Path -Path $HOME\dotfiles)) {
    echo 'cloning dotfiles repository to $HOME...'
    git clone git@github.com:McClunatic\dotfiles.git $HOME\dotfiles
}

# Stash current files to restore HEAD files
echo 'stashing $HOME working tree files to restore dotfiles...'
git --git-dir $HOME\dotfiles\.git --work-tree $HOME stash

# Source .profile.ps1 to bootstrap current shell
echo 'sourcing $HOME\.profile.ps1 to bootstrap current shell...'
. $HOME\.profile.ps1

# Copy .profile.ps1 to $PROFILE for future shells
echo 'copying $HOME\.profile.ps1 to $PROFILE...'
cp $HOME\.profile.ps1 $PROFILE

# Copy helix configuration files to $env:APPDATA
echo 'copying helix configuration files to $env:APPDATA...'
mkdir $env:APPDATA\helix -ErrorAction SilentlyContinue
cp $HOME\.config\helix\*.toml $env:APPDATA\helix

echo 'complete!'
