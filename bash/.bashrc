[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'

# User
alias config="sudo vim /etc/nixos/configuration.nix && sudo nixos-rebuild switch"
alias vbashrc='vim ~/.bashrc && source ~/.bashrc && clear'
alias clear="clear && echo '' && neofetch"
alias valacr='vim .alacritty.toml'

PS1='\[\033[1;3;35m\]\u\[\033[0m\]\[\033[1;92m\]@\[\033[0m\]\[\033[1;34m\]\h\[\033[0m\]\[\033[1;36m\][\[\033[0m\]\[\033[1;36m\]\W\[\033[0m\]\[\033[1;36m\]]\[\033[0m\]\[\033[1;34m\]> \[\033[0m\]'

echo ""
neofetch
