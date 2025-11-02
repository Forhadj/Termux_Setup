#!/usr/bin/env bash
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
#  ＦＯＲＨＡＤ  ＴＥＲＭＵＸ  ＳＥＴＵＰ  ＴＯＯＬ
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
# Author  : Md Forhad
# GitHub  : https://github.com/Forhadj
# Telegram: @f_forhad
# Version : 1.3 (Public)
# License : MIT
# Description : Complete Termux setup installer for beginners & pro users.
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

set -e

# Colors
G='\033[1;32m'
Y='\033[1;33m'
B='\033[1;34m'
R='\033[1;31m'
C='\033[1;36m'
W='\033[0m'

# Banner
logo() {
  clear
  echo -e "${G}"
  cat <<'BANNER'
@@@@@@@ @@@@@@@@ @@@@@@@  @@@@@@@@@@  @@@  @@@ @@@  @@@
  @!!   @@!      @@!  @@@ @@! @@! @@! @@!  @@@ @@!  !@@
  @!!   @!!!:!   @!@!!@!  @!! !!@ @!@ @!@  !@!  !@@!@! 
  !!:   !!:      !!: :!!  !!:     !!: !!:  !!!  !: :!! 
   :    : :: ::   :   : :  :      :    :.:: :  :::  :::
                                                       
                                                       
 @@@@@@ @@@@@@@@ @@@@@@@ @@@  @@@ @@@@@@@              
!@@     @@!        @!!   @@!  @@@ @@!  @@@             
 !@@!!  @!!!:!     @!!   @!@  !@! @!@@!@!              
    !:! !!:        !!:   !!:  !!! !!:                  
::.: :  : :: ::     :     :.:: :   :
BANNER

  echo -e "${Y}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${W}"
  echo -e "${C}  ⚙️  Auto Setup Tool v1.3 | by Md Forhad${W}"
  echo -e "${B}  🔗 GitHub: https://github.com/Forhadj${W}"
  echo -e "${B}  💬 Telegram: @f_forhad${W}"
  echo -e "${Y}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${W}\n"
}

# Install packages
install_pkg() {
  for pkg in "$@"; do
    echo -e "${B}[+] Installing package:${W} ${Y}$pkg${W}"
    pkg install -y "$pkg" >/dev/null 2>&1 || echo -e "${R}[-] Failed:$pkg${W}"
  done
}

install_pip() {
  for mod in "$@"; do
    echo -e "${C}[+] Installing Python module:${W} ${Y}$mod${W}"
    pip install "$mod" -q || true
    pip2 install "$mod" -q || true
  done
}

# Main setup
main() {
  logo
  echo -e "${Y}[•] Updating Termux packages...${W}"
  pkg update -y >/dev/null 2>&1
  pkg upgrade -y >/dev/null 2>&1

  echo -e "${Y}[•] Installing essential packages...${W}"
  install_pkg git curl bash coreutils python python2 python2-dev python3 nano tar clang make cmake pkg-config nodejs golang openjdk-17 zsh fish tmux htop ncdu wget net-tools openssh socat tcpdump nmap hydra sqlmap john aircrack-ng ettercap unzip zip rsync openssl proot-distro figlet cowsay

  echo -e "${Y}[•] Installing Python modules...${W}"
  install_pip requests mechanize beautifulsoup4 futures rich urllib3 paramiko tqdm flask fastapi cryptography lolcat

  echo -e "${Y}[•] Setting up Termux storage...${W}"
  termux-setup-storage >/dev/null 2>&1 || true

  echo -e "\n${G}[✓] Setup Complete!${W}"
  echo -e "${C}[✓] Type this command to test:${W}  figlet FORHAD | lolcat"
  echo -e "${G}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${W}"
  echo -e "${B}   🔗 GitHub:${W} ${Y}https://github.com/Forhadj${W}"
  echo -e "${B}   💬 Telegram:${W} ${Y}@f_forhad${W}"
  echo -e "${G}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${W}"
}

main
