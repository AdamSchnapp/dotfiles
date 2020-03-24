
# USE GNU lINUX UTILS INSTEAD OF MAC
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"

# COMMAND LINE/SHELL BEHAVIOR
shopt -s direxpand  # expand variables tab at interactive shell
set -o vi # vim-style command line editing

alias "ls=ls --color=auto"
alias h=history
alias e=exit
alias c=clear

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"
