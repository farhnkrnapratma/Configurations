# Aliases
alias ls="ls --color=auto"
alias grep="grep --color=auto"
alias clear="clear && echo '' && neofetch"
alias config="sudo vim /etc/nixos/configuration.nix && sudo nixos-rebuild switch"
alias cleaning="sudo nix-collect-garbage -d"
alias vbashrc="vim ~/.bashrc && source ~/.bashrc && clear"
alias valacrt="vim ~/.alacritty.toml"

# Custom bash promt
PS1='\n\[\e[34m\]╭\[\e[0m\]\[\e[44m\]\[\e[30m\] \[\e[1m\]\u\[\e[0m\]\[\e[34m\]─\[\e[0m\]\[\e[44m\]\[\e[30m\] \[\e[1m\]\h\[\e[0m\]\[\e[34m\]─\[\e[0m\]\[\e[44m\]\[\e[30m\] \[\e[1m\]\d\[\e[0m\]\[\e[34m\]─\[\e[0m\]\[\e[44m\]\[\e[30m\] \[\e[1m\]\t\[\e[0m\]\[\e[34m\]─\[\e[0m\]\[\e[44m\]\[\e[30m\]\[\e[1m\] \!│ \#\[\e[0m\]\[\e[34m\]\n│\n╰\[\e[0m\]\e[44m\]\[\e[30m\]\[\e[1m\]\w\[\e[0m\]\[\e[34m\] \[\e[0m\] '

# Run command(s) when opening new session
neofetch
