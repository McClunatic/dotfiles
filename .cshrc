# ~/.cshrc: executed by csh(1) for non-login shells.

# add alias for managing dotfiles
alias dit 'git -c status.showUntrackedFiles=no --git-dir=$HOME/dotfiles/.git --work-tree=$HOME'

# set the default editor
which vim >& /dev/null
if ( $status == 0 ) setenv EDITOR vim

# set the default pager
which less >& /dev/null
if ( $status == 0 ) setenv PAGER less

# set PATH so it includes user's private bin if it exists
if ( -d "$HOME/bin" ) setenv PATH "$HOME/bin:$PATH"

# set PATH so it includes user's private bin if it exists
if ( -d "$HOME/.local/bin" ) setenv PATH "$HOME/.local/bin:$PATH"

# extend initialization if local configuration exists
if ( -f "$HOME/.cshrc_local" ) source "$HOME/.cshrc_local"

# set up shell to use starship prompt (see https://starship.rs)
which starship >& /dev/null
if ( $status == 0 ) eval `starship init tcsh`
