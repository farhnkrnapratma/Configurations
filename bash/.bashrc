# Editor---{{{

# Assuming you are using Vim as your code editor, if not please change it yourself~
export EDITOR=vim
export VISUAL=vim

#---}}}

# Aliases---{{{

alias ls="ls --color=auto"
alias grep="grep --color=auto"

# Open and edit Bash run commands ~/.bashrc
alias bashrc="$EDITOR ~/.bashrc && source ~/.bashrc && clear"

# NixOS
alias nxsedit="sudo nixos-rebuild edit"
alias nxswitch="sudo nixos-rebuild switch"
alias nxsboot="sudo nixos-rebuild boot"
alias nxstest="sudo nixos-rebuild test"
alias nxsbuild="sudo nixos-rebuild build"
alias nxsdbuild="sudo nixos-rebuild dry-build"
alias nxsdactvt="sudo nixos-rebuild dry-activate"t

# Nix
alias nxcupdt="sudo nix-channel --update"
alias nxdgrbg="sudo nix-collect-garbage -d"

#---}}}

# PS1---{{{

# with_icon boolean
with_icon=true

if [[ $with_icon == true ]]; then
    PS1='\n\[\e[34m\]╭\[\e[0m\]\[\e[44m\e[30m\] \[\e[1m\]\u\[\e[0m\e[34m\]─\[\e[0m\]\[\e[44m\e[30m\] \[\e[1m\]\h\[\e[0m\e[34m\]─\[\e[0m\]\[\e[44m\e[30m\] \[\e[1m\]\d\[\e[0m\e[34m\]─\[\e[0m\]\[\e[44m\e[30m\] \[\e[1m\]\t\[\e[0m\e[34m\]─\[\e[0m\]\[\e[44m\e[30m\] \[\e[1m\]\!│ \#\[\e[0m\e[34m\]\n│\n╰\[\e[0m\]\[\e[44m\e[30m\] \[\e[1m\]\w\[\e[0m\e[34m\] \[\e[0m\] '
else
    PS1='\n\[\e[34m\]╭\[\e[0m\]\[\e[44m\e[30;1m\]\u\[\e[0m\e[34m\]─\[\e[0m\]\[\e[44m\e[30;1m\]\h\[\e[0m\e[34m\]─\[\e[0m\]\[\e[44m\e[30;1m\]\d\[\e[0m\e[34m\]─\[\e[0m\]\[\e[44m\e[30;1m\]\t\[\e[0m\e[34m\]─\[\e[0m\]\[\e[44m\e[30;1m\]\!│\#\[\e[0m\e[34m\]\n│\n╰\[\e[0m\]\[\e[44m\e[30;1m\]\w\[\e[0m\e[34m\] \[\e[0m\] '
fi

#---}}}

# Run command(s)---{{{

# When the clear command is executed then run it too...
clear() {
    command clear
    neofetch
}
neofetch

#---}}}
