[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'

# User
alias config="sudo vim /etc/nixos/configuration.nix && sudo nixos-rebuild switch"
alias cleaning="sudo nix-collect-garbage -d"
alias vbashrc='vim ~/.bashrc && source ~/.bashrc && clear'
alias clear="clear && echo '' && neofetch"
alias valacr='vim .alacritty.toml'

PS1='\[\e[36m\] (\w)  \[\e[0m\]'

echo ""
neofetch
