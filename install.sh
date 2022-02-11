#!/bin/sh

sudo apt-get update

#################### INSTALL ZSHRC ###################
# Install zshrc
sudo apt-get install zsh
sudo chsh -s $(which zsh)

# Install ohmyzsh
sudo apt-get install git curl
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install the powerlevel10k theme
git clone https://github.com/romkatv/powerlevel10k.git $HOME/.oh-my-zsh/custom/themes/powerlevel10k

# Apply zsh configuration
ln -s ${pwd}/.zshrc ~/.zshrc
source ~/.zshrc
######################################################


