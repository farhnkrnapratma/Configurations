export EDITOR=vim
export VISUAL=vim

# PS1
PS1='\[\033[1;36m\]╭ (\033[1;31m\w\033[0m\[\033[1;36m\])\n│\n╰ (\033[1;35m\u@\h\033[0m\033[1;36m)  \[\033[0m\]'

# Run
echo ""
neofetch

# System
alias ls="ls --color=auto"
alias grep="grep --color=auto"
alias clear="clear && echo '' && neofetch"
# Bash
alias bashrc="$EDITOR ~/.bashrc && source ~/.bashrc && clear"
# Cava
alias cava="TERM=st-256color cava"
# Git
alias gcommit="git add . && git commit -m"
alias gpush="git push"
alias gstatus="git status"
alias gbranch="git branch"
# NixOS
alias nconfig="sudo $EDITOR /etc/nixos/configuration.nix"
alias nswitch="sudo nixos-rebuild switch"
alias nboot="sudo nixos-rebuild boot"
alias ntest="sudo nixos-rebuild test"
alias nbuild="sudo nixos-rebuild build"
# Nix
alias nupdate="sudo nix-channel --update"
alias ngarbage="sudo nix-collect-garbage -d"