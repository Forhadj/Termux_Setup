#!/usr/bin/env bash
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
#  ＦＯＲＨＡＤ  ＴＥＲＭＵＸ  ＳＥＴＵＰ  ＴＯＯＬ  (interactive)
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
# Author  : Md Forhad
# GitHub  : https://github.com/Forhadj
# Telegram: @f_forhad / Channel: https://t.me/Tech_32
# Version : 1.3 (Interactive)
# License : MIT
# Description : Choose core Termux setup or NetHunter essentials (or both).
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

set -euo pipefail

# COLORS
G='\033[1;32m'; Y='\033[1;33m'; B='\033[1;34m'; R='\033[1;31m'; C='\033[1;36m'; W='\033[0m'

LOGFILE="$HOME/forhad-termux-setup.log"
log(){ echo -e "$(date '+%F %T') - $*" | tee -a "$LOGFILE"; }

TELEGRAM_CHANNEL_URL="https://t.me/Tech_32"

# ---------- logo (unchanged) ----------
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
  echo -e "${B}  💬 Telegram: @f_forhad  |  Channel: ${TELEGRAM_CHANNEL_URL}${W}"
  echo -e "${Y}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${W}\n"
}

# ---------- open Telegram channel (attempt) ----------
open_telegram_channel() {
  echo -e "${C}Opening Telegram channel: ${Y}${TELEGRAM_CHANNEL_URL}${W}"
  # If termux-open-url exists, use it (opens in Telegram app if installed)
  if command -v termux-open-url >/dev/null 2>&1; then
    termux-open-url "$TELEGRAM_CHANNEL_URL" >/dev/null 2>&1 || log "termux-open-url failed to open $TELEGRAM_CHANNEL_URL"
    echo -e "${G}If your Telegram app opened, please check the channel. Returning to installer in 5 seconds...${W}"
    sleep 5
  else
    # fallback: show url and wait for user to confirm they've visited it
    echo -e "${Y}Please open this Telegram channel for setup instructions:${W}"
    echo -e "${B}${TELEGRAM_CHANNEL_URL}${W}"
    read -rp $'Press Enter to continue after visiting the channel (or Ctrl+C to cancel)...' _
  fi
}

# ---------- installers ----------
# safe pkg installer with simple progress
safe_pkg_install() {
  names=("$@")
  total=${#names[@]}
  i=0
  for pkg in "${names[@]}"; do
    i=$((i+1))
    pct=$((i*100/total))
    echo -ne "${B}[${pct}%] Installing: ${Y}$pkg${W}\r"
    if pkg install -y "$pkg" >/dev/null 2>&1; then
      log "[OK] pkg: $pkg"
    else
      log "[FAIL] pkg: $pkg"
      echo -ne "${R}[-] Failed: $pkg${W}\n"
    fi
    sleep 0.12
  done
  echo -e "\n${G}[✓] pkg group finished.${W}"
}

safe_pip_install() {
  names=("$@")
  total=${#names[@]}
  i=0
  for mod in "${names[@]}"; do
    i=$((i+1))
    pct=$((i*100/total))
    echo -ne "${C}[${pct}%] Installing Python module: ${Y}$mod${W}\r"
    if command -v pip3 >/dev/null 2>&1; then
      if pip3 install --no-input "$mod" >/dev/null 2>&1; then
        log "[OK] pip3: $mod"
      else
        log "[FAIL] pip3: $mod"
        echo -ne "${R}[-] Failed pip3: $mod${W}\n"
      fi
    elif command -v pip >/dev/null 2>&1; then
      if pip install --no-input "$mod" >/dev/null 2>&1; then
        log "[OK] pip: $mod"
      else
        log "[FAIL] pip: $mod"
        echo -ne "${R}[-] Failed pip: $mod${W}\n"
      fi
    else
      log "[SKIP] no pip for $mod"
      echo -ne "${R}[-] No pip found to install: $mod${W}\n"
    fi
    sleep 0.12
  done
  echo -e "\n${G}[✓] Python modules group finished.${W}"
}

# ---------- groups ----------
# Group 1 = Termux Setup (Core) — minimal & needed packages
GROUP1_PKG=(
  git curl bash coreutils python python3 python2 nano tar
)

# All Python modules moved into Group 1 as requested
GROUP1_PIP=(
  requests
  mechanize
  beautifulsoup4
  bs4
  futures
  rich
  lolcat
  urllib3
  pyopenssl
  paramiko
  tqdm
  flask
  fastapi
  cryptography
  sqlmap
)

# Group 2 = NetHunter Essentials (Offshore) — tools / helpers for NetHunter installs
GROUP2_PKG=(
  proot-distro proot pulseaudio termux-api wget openssh resolv-conf
  unzip zip rsync
)
GROUP2_PIP=(
  # minimal; main modules are in GROUP1_PIP
)

# ---------- menu ----------
print_menu() {
  logo
  echo -e "${Y}Select an option:${W}"
  echo -e "  ${G}1${W} — Termux Setup (Core)  (includes ALL Python modules)"
  echo -e "  ${G}2${W} — NetHunter Essentials (proot/proot-distro etc.)"
  echo -e "  ${G}3${W} — About"
  echo -e "  ${G}4${W} — Exit"
  echo -e "  ${G}all${W} — Install both groups\n"
  echo -e "${C}Example:${W} 1    or    2    or    all"
  echo
}

show_about() {
  logo
  cat <<EOF
FORHAD Termux Setup Tool v1.3
Author : Md Forhad
GitHub : https://github.com/Forhadj
Telegram: @f_forhad
Channel : ${TELEGRAM_CHANNEL_URL}

This tool helps you:
 - Install a minimal Termux environment (Group 1) + ALL Python modules
 - Install NetHunter helper packages (Group 2)
 - Logs all actions to: $LOGFILE

Use responsibly. Some packages (proot-distro, pulseaudio, resolv-conf) may not exist
in all Termux repos; if missing, the script will log the failure and continue.
EOF
  echo
  read -rp $'Press Enter to return to menu...' _dummy
}

# ---------- main ----------
main_menu_loop() {
  # open telegram channel first (attempt)
  open_telegram_channel

  while true; do
    print_menu
    read -rp $'Choose (1/2/3/4/all): ' sel
    sel="${sel,,}"   # lowercase

    # update before any install
    log "Running pkg update && pkg upgrade"
    pkg update -y >/dev/null 2>&1 || log "pkg update failed"
    pkg upgrade -y >/dev/null 2>&1 || log "pkg upgrade failed"

    case "$sel" in
      ""|"1")
        log "Installing Group 1: Termux Setup (Core + ALL Python modules)"
        echo -e "${Y}[•] Installing Termux core packages...${W}"
        safe_pkg_install "${GROUP1_PKG[@]}"
        echo -e "${Y}[•] Installing ALL Python modules (Group 1)...${W}"
        safe_pip_install "${GROUP1_PIP[@]}"
        ;;
      "2")
        log "Installing Group 2: NetHunter Essentials"
        echo -e "${Y}[•] Installing NetHunter helper packages...${W}"
        safe_pkg_install "${GROUP2_PKG[@]}"
        echo -e "${Y}[•] Installing NetHunter Python libs (if any)...${W}"
        safe_pip_install "${GROUP2_PIP[@]}"
        echo -e "${Y}[•] Note:${W} After proot-distro you can run 'proot-distro install <distro>' (e.g. kali) per NetHunter guides."
        ;;
      "all")
        log "Installing ALL groups"
        echo -e "${Y}[•] Installing Termux core packages...${W}"
        safe_pkg_install "${GROUP1_PKG[@]}"
        echo -e "${Y}[•] Installing ALL Python modules (Group 1)...${W}"
        safe_pip_install "${GROUP1_PIP[@]}"
        echo -e "${Y}[•] Installing NetHunter helper packages...${W}"
        safe_pkg_install "${GROUP2_PKG[@]}"
        echo -e "${Y}[•] Installing NetHunter Python libs (if any)...${W}"
        safe_pip_install "${GROUP2_PIP[@]}"
        ;;
      "3")
        show_about
        ;;
      "4"|"exit"|"quit")
        log "User selected Exit. Exiting."
        echo -e "${G}Goodbye. Check log: ${Y}$LOGFILE${W}"
        exit 0
        ;;
      *)
        echo -e "${R}Invalid option. Choose 1, 2, 3, 4 or all.${W}"
        ;;
    esac

    echo
    read -rp $'Do you want to return to the menu? (Y/n): ' again
    again=${again:-Y}
    if [[ ! "$again" =~ ^[Yy]$ ]]; then
      log "User chose not to return to menu. Exiting."
      echo -e "${G}Done. Check log: ${Y}$LOGFILE${W}"
      exit 0
    fi
  done
}

main_menu_loop "$@"
