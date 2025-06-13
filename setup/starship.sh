#!/bin/bash

# https://starship.rs

curl -sS https://starship.rs/install.sh | sh -s -- --bin-dir /usr/local/bin

echo "eval '$(starship init bash)'" >> ~/.bashrc

# change vscode font to "JetBrainsMono Nerd Font"
# install the font if not existed in the system and copy to C://Window/font

mkdir ~/.config

# choose a font in this link https://starship.rs/presets/
# starship preset <font-name> -o ~/.config/starship.toml
starship preset pastel-powerline -o ~/.config/starship.toml
