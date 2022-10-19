#!/bin/bash

readonly WHITE="\033[1;37m"
readonly GRAY_LIGHT="\033[0;37m"
readonly GREEN="\033[1;32m"
readonly NC="\033[0m"

print_banner() {

  clear

  printf "\n"

  printf "${GREEN}";
  printf "███████ ███    ███ ██    ██ ███    ██  ██████  ███████ ██   ██ ███████ ██████  ███    ██               ██████  ███████ ██    ██      ██████ ██    ██ ███████ ████████  ██████  ███    ███ ██ ███████ ███████ \n";
  printf "██      ████  ████ ██    ██ ████   ██ ██    ██    ███  ██   ██ ██      ██   ██ ████   ██               ██   ██ ██      ██    ██     ██      ██    ██ ██         ██    ██    ██ ████  ████ ██    ███  ██      \n";
  printf "█████   ██ ████ ██ ██    ██ ██ ██  ██ ██    ██   ███   ███████ █████   ██████  ██ ██  ██     █████     ██   ██ █████   ██    ██     ██      ██    ██ ███████    ██    ██    ██ ██ ████ ██ ██   ███   █████   \n";
  printf "██      ██  ██  ██ ██    ██ ██  ██ ██ ██    ██  ███    ██   ██ ██      ██   ██ ██  ██ ██               ██   ██ ██       ██  ██      ██      ██    ██      ██    ██    ██    ██ ██  ██  ██ ██  ███    ██      \n";
  printf "███████ ██      ██  ██████  ██   ████  ██████  ███████ ██   ██ ███████ ██   ██ ██   ████               ██████  ███████   ████        ██████  ██████  ███████    ██     ██████  ██      ██ ██ ███████ ███████ \n";
  printf "${NC}";

  printf "\n"
}

print_banner
printf "${WHITE} 💻 Instalando dependencias de zsh...${GRAY_LIGHT}"
printf "\n\n"
sudo apt-get install git zsh

print_banner
printf "${WHITE} 💻 Activando y cambiando de terminal a zsh...${GRAY_LIGHT}"
printf "\n\n"
chsh -s $(which zsh)

print_banner
printf "${WHITE} 💻 Instalando dependencias de oh my zsh...${GRAY_LIGHT}"
printf "\n\n"
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

print_banner
printf "${WHITE} 💻 Instalando plugins de oh my zsh...${GRAY_LIGHT}"
printf "\n\n"


if [ ! -d "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting" ] ; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    sed -i 's/plugins=(git/plugins=(git \nzsh-syntax-highlighting/' ~/.zshrc
fi

if [ ! -d "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" ] ; then
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    sed -i 's/plugins=(git/plugins=(git \nzsh-autosuggestions/' ~/.zshrc
fi
