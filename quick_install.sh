#!/usr/bin/env bash
# Quick full install — runs the exact commands you provided (safe continue on errors)
set -euo pipefail
LOG="$HOME/forhad-exact-install.log"
exec > >(tee -a "$LOG") 2>&1

echo "Started: $(date)"
pkg update -y || true
pkg upgrade -y || true

pkg install -y python || true
pkg install -y python2 || true
pkg install -y python2-dev || true
pkg install -y python3 || true

# pip installs (try pip/pip3 first)
if command -v pip >/dev/null 2>&1 || command -v pip3 >/dev/null 2>&1; then
  pip install --no-input requests || true
  pip2 install --no-input requests || true
  pip install --no-input mechanize || true
  pip2 install --no-input mechanize || true
  pip install --no-input lolcat || true
  pip install --no-input bs4 || true
  pip2 install --no-input bs4 || true
  pip2 install --no-input requests bs4 || true
  pip install --no-input futures || true
  pip2 install --no-input futures || true
  pip install --no-input rich || true
fi

pkg install -y java || pkg install -y openjdk-17 || true
pkg install -y fish || true
pkg install -y ruby || true
pkg install -y help || true
pkg install -y git || true
pkg install -y host || true
pkg install -y php || true
pkg install -y perl || true
pkg install -y nmap || true
pkg install -y bash || true
pkg install -y clang || true
pkg install -y nano || true
pkg install -y w3m || true
pkg install -y havij || true
pkg install -y hydra || true
pkg install -y figlet || true
pkg install -y cowsay || true
pkg install -y curl || true
pkg install -y tar || true

pkg update -y || true
pkg upgrade -y || true

echo "Done: $(date)"
echo "Log: $LOG"
