# Set default editor
export EDITOR=vim
export VISUAL=vim

# PS1 prompt with git branch
git_branch() {
    if git rev-parse --is-inside-work-tree &>/dev/null; then
        echo -e "\033[1;36m  (\033[0m\033[1;35m$(git branch --show-current)\033[0m\033[36m)"
    fi
}

PS1='\[\033[1;36m\]╭ (\033[1;35m\w\033[0m\[\033[1;36m\])$(git_branch)\n│\n╰ (\033[1;35m\u\033[1;36m@\033[0m\033[1;35m\h\033[0m\033[1;36m) \[\033[0m\]'

# System aliases
alias ls="ls --color=auto"
alias grep="grep --color=auto"

# Bash alias
alias bashrc="$EDITOR ~/.bashrc && source ~/.bashrc && clear"

# Neofetch alias
alias nfetch="echo '' && neofetch --config ~/Project/dotfiles/neofetch/config.conf --ascii_distro $(uname -n)_small"

# Cava alias
alias cava="TERM=st-256color cava"

# Git aliases
alias gcommit="git add . && git commit -m"
alias gpush="git push"
alias gstatus="git status"
alias gbranch="git branch"

# NixOS aliases
alias nconfig="sudo $EDITOR /etc/nixos/configuration.nix"
alias nswitch="sudo nixos-rebuild switch"
alias nboot="sudo nixos-rebuild boot"
alias ntest="sudo nixos-rebuild test"
alias nbuild="sudo nixos-rebuild build"

# Nix aliases
alias nupdate="sudo nix-channel --update"
alias ngarbage="sudo nix-collect-garbage -d"

# Override clear command to run neofetch
clear() {
    command clear
    nfetch
}

# Run neofetch on startup
nfetch
