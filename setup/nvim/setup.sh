g!/bin/bash

# Install nvim
mkdir -pv ~/.local
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
sudo rm -rf $HOME/.local/nvim
sudo tar -C $HOME/.local -xzf nvim-linux-x86_64.tar.gz
rm -rf nvim-linux-x86_64.tar.gz
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:$HOME/.local/nvim-linux-x86_64/bin"

# Copy config file to $HOME/.config dir
mkdir -pv ~/.config/nvim
cp ~/scripts/config/nvim/init.vim ~/.config/nvim/

# Install vim-plug
 sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
