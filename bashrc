
# USE GNU lINUX UTILS INSTEAD OF MAC
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"

# COMMAND LINE/SHELL BEHAVIOR
shopt -s direxpand  # expand variables tab at interactive shell
set -o vi # vim-style command line editing

alias ls="ls --color=auto"
alias grep="grep --color=auto"
alias h=history
alias e=exit
alias c=clear

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"

# MY PROMPT
parse_git_branch() {
        git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
    }
bldred=$(tput setaf 1) #'\e[1;31m' # Red
bldgreen=$(tput setaf 2) #'\e[1;32m' # Green
bldcyn=$(tput setaf 6) #'\e[1;36m' # Cyan
bldwht=$(tput setaf 7) #'\e[1;37m' # White
txtrst=$(tput sgr0) #'\e[0m'    # Text Reset - Useful for avoiding color bleed
export PS1="\[$bldred\]\u\[$txtrst\]@\[$bldwht\]\h\[$txtrst\]:\[$bldcyn\]\w\[$txtrst\]\[$bldgreen\]\$(parse_git_branch)\[$txtrst\]$ "
