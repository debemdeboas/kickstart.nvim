#!/bin/bash

if ! [ -x "$(command -v nvim)"  ]; then
	echo "Installing NeoVim..."
	curl -LO "https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz"
	sudo rm -rf /opt/nvim
	sudo tar -C /opt -xzf nvim-linux64.tar.gz
	echo "export PATH=\"$PATH:/opt/nvim-linux64/bin\"" >> ~/.bashrc
fi

if ! [ -x "$(command -v rg)" ]; then
	echo "Installing ripgrep..."

	rgver=$(curl -I -s "https://github.com/BurntSushi/ripgrep/releases/latest/" | grep location: | awk '{print substr($2,52)}' | tr -d '\r')
	curl -LO "https://github.com/BurntSushi/ripgrep/releases/tag/${rgver}/ripgrep_${rgver}_amd64.deb"
	sudo dpkg -i ripgrep_${rgver}_amd64.deb

	sudo apt update && sudo apt install -y ripgrep
fi

