# If set, a command name that is the name of a directory is executed
# as if it were the argument to the cd command. This option is only
# used by interactive shells.
shopt -s autocd

# If set, minor errors in the spelling of a directory component in a cd
# command will be corrected.  The errors checked for are  transposed
# characters, a missing character, and one character too many.  If a
# correction is found, the corrected filename is printed, and
# the command proceeds.  This option is only used by interactive shells.
shopt -s cdspell

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

# append to the history file, don't overwrite it
shopt -s histappend
