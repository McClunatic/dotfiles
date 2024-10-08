# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Source .bashrc.d files, if they exist
if [ -d ~/.bashrc.d ]; then
    for i in ~/.bashrc.d/*.sh; do
        if [ -r $i ]; then
            . $i
        fi
    done
    unset i
fi
