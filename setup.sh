#!/bin/sh

if [ -f "/etc/os-release" ] && grep -q "ID=nixos" /etc/os-release; then
    bash_path="/usr/bin/env bash"
else
    bash_path="/bin/bash"
fi

"$bash_path" -c 'echo "This is running on the correct bash path: $0"'


copy() {
    type=$1
    sudo=$2
    src=$3
    dest=$4

    if [[ -z "$type" || -z "$sudo" || -z "$src" || -z "$dest" ]]; then
        echo "Usage: copy <[f]ile|[d]irectory> <[0]|[1]> <source_path> <destination_path>"
        return 1
    fi

    if [[ "$type" == "f" ]]; then
        if [ -f "$src" ]; then
            if [[ "$sudo" == 1 ]]; then
                if [ ! -d "$dest" ]; then
                    echo "Folder '$dest' not found. Creating folder..."
                    mkdir -p "$dest"
                    echo "Folder '$dest' has been created."
                    sudo cp "$src" "$dest"
                else
                    sudo cp "$src" "$dest"
                fi
            else
                if [ ! -d "$dest" ]; then
                    echo "Folder '$dest' not found. Creating folder..."
                    mkdir -p "$dest"
                    echo "Folder '$dest' has been created."
                    cp "$src" "$dest"
                else
                    cp "$src" "$dest"
                fi
            fi
            echo "File '$src' successfully copied to '$dest'."
        else
            echo "File '$src' not found."
        fi
    elif [[ "$type" == "d" ]]; then
        if [ -d "$src" ]; then
            if [[ "$sudo" == 1 ]]; then
                if [ ! -d "$dest" ]; then
                    echo "Folder '$dest' not found. Creating folder..."
                    mkdir -p "$dest"
                    echo "Folder '$dest' has been created."
                    sudo cp -r "$src" "$dest"
                else
                    sudo cp -r "$src" "$dest"
                fi
            else
                if [ ! -d "$dest" ]; then
                    echo "Folder '$dest' not found. Creating folder..."
                    mkdir -p "$dest"
                    echo "Folder '$dest' has been created."
                    cp -r "$src" "$dest"
                else
                    cp -r "$src" "$dest"
                fi
            fi
            echo "Folder '$src' successfully copied to '$dest'."
        else
            echo "Folder '$src' not found."
        fi
    else
        echo "Invalid type. Use 'f' or 'd'."
        return 1
    fi
}

nerdfonts() {
    family="UbuntuMono"
    url="https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/$family.zip"
    echo $url
    mkdir -p $HOME/$family
    wget -P $HOME/$family $url
    unzip $HOME/$family/$family.zip -d $HOME/$family
    rm $HOME/$family/$family.zip
    find $HOME/$family -type f ! -name "*.ttf" -exec rm {} +
    
    if [ ! -d "/usr/share/fonts/truetype" ]; then
        sudo mv $HOME/$family /usr/share/fonts
    else
        sudo mv $HOME/$family /usr/share/fonts/truetype
    fi

    echo "Nerd Fonts: Done."
}

bash() {
    copy f 0 ./bash/.bashrc $HOME
    source $HOME/.bashrc
    echo "Bash: Done."
}

btop() {
    copy f 0 ./btop/btop.conf $HOME/.config/btop/
    echo "Btop: Done."
}

cava() {
    copy f 0 ./cava/config $HOME/.config/cava/
    echo "Cava: Done."
}

kitty() {
    copy f 0 ./kitty/kitty.conf $HOME/.config/kitty/
    copy f 0 ./kitty/current-theme.conf $HOME/.config/kitty/
    echo "Kitty: Done."
}

neofetch() {
    copy f 0 ./neofetch/config.conf $HOME/.config/neofetch/
    echo "Neofetch: Done."
}

tmux() {
    copy f 0 ./tmux/.tmux.conf $HOME
    git clone https://github.com/catppuccin/tmux.git $HOME/catppuccin
    git clone https://github.com/tmux-plugins/tmux-cpu $HOME/tmux-cpu
    git clone https://github.com/tmux-plugins/tmux-battery $HOME/tmux-battery

    dirs=("$HOME/catppuccin" "$HOME/tmux-cpu" "$HOME/tmux-battery")
    dest="$HOME/.config/tmux/plugins/"

    for dir in "${dirs[@]}"; do
        copy d 0 "$dir" "$dest"
        echo "Deleting '$dir'..."
        rm -rf "$dir"
    done

    echo "Tmux: Done."
}

vim() {
    curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    copy f 0 ./vim/.vimrc $HOME
    echo "Vim: Done."
}

nixos() {
    copy f 1 ./nixos/configuration.nix /etc/nixos/
    copy f 1 ./desktop/wallpaper.jpg /etc/nixos/
    sudo nixos-rebuild switch
    echo "NixOS: Done."
}

full_setup() {
    if [ $(uname -n) = "NixOS" ]; then
        nixos
        bash
        btop
        cava
        kitty
        neofetch
        tmux
        vim
    else
        nerdfonts
        bash
        btop
        cava
        kitty
        neofetch
        tmux
        vim
    fi
    echo "Full setup: Done."

    read -p "Reboot [Y/n]: " options
    options="${options:-Y}"

    if  [[ "$options" =~ ^[Yy]$ ]]; then
        echo "Rebooting..."
        sudo reboot
    else
        echo "Setup complete!"
    fi
}

echo "Configuration Options\n"
echo "[1] Full setup"
echo "[2] Bash"
echo "[3] Btop"
echo "[4] Cava"
echo "[5] Kitty"
echo "[6] Neofetch"
echo "[7] Tmux"
echo "[8] Vim"
echo "[9] Nerd Fonts"
echo "[10] Exit"

read -p "Enter option: " option

case $option in
    1) full_setup ;;
    2) bash ;;
    3) btop ;;
    4) cava ;;
    5) kitty ;;
    6) neofetch ;;
    7) tmux ;;
    8) vim ;;
    9) nerdfonts ;;
    10) echo "Exit..."; exit ;;
    *) echo "Invalid option." ;;
esac
