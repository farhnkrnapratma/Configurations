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
alias nxsuedit="sudo $EDITOR /etc/nixos/configuration.nix"
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

PS1='\[\033[1;36m\]\w  \[\033[0m\]'

#---}}}

# Run command(s)---{{{

# When the clear command is executed then run it too...
clear() {
    command clear
    pfetch
}

pfetch

#---}}}
