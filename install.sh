#!/bin/bash -e

sudo apt-get update

#################### INSTALL ZSHRC ###################
# Install zshrc
echo "[-] Installing zsh... [-]"
sudo apt-get install zsh -y
sudo chsh -s $(which zsh)

# Install ohmyzsh
echo "[-] Installing oh my zsh... [-]"
sudo apt-get install git curl -y
if [ ! -d "$HOME/.oh-my-zsh" ]; then
	sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# Install the powerlevel10k theme
echo "[-] Install powerlevel10k... [-]"
if [ ! -d "$HOME/.oh-my-zsh/custom/themes/powerlevel10k" ]; then
	git clone https://github.com/romkatv/powerlevel10k.git $HOME/.oh-my-zsh/custom/themes/powerlevel10k
fi

# Apply zsh configuration
echo "[-] Apply zsh configuration... [-]" 
cp .zshrc ~/.zshrc
cp .p10k.zsh ~/.p10k.zsh
source ~/.zshrc
######################################################
