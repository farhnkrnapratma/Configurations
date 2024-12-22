# dotfiles
My dotfiles configuration

## Alacritty Theme

Collection of colorschemes for easy configuration of the Alacritty terminal emulator. Clone the repository, or download the theme of your choice:

```
# We use Alacritty's default Linux config directory as our storage location here.
mkdir -p ~/.config/alacritty/themes
git clone https://github.com/alacritty/alacritty-theme ~/.config/alacritty/themes
```

Add an import to your alacritty.toml (Replace {theme} with your desired colorscheme):


```
[general]
import = [
    "~/.config/alacritty/themes/themes/{theme}.toml"
]
```
