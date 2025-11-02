# ＦＯＲＨＡＤ Termux Setup Tool

Complete Termux setup for beginners & advanced users.

---

## 1️⃣ Core (Required)
**Packages:** git, curl, bash, coreutils, python, python2, python2-dev, python3, nano, tar
```bash
pkg update -y && pkg upgrade -y
pkg install -y git curl bash coreutils python python2 python2-dev python3 nano tar
```

## 2️⃣ Development (Optional)
**Packages:** clang, make, cmake, pkg-config, nodejs, golang, openjdk-17
```bash
pkg install -y clang make cmake pkg-config nodejs golang openjdk-17
```

## 3️⃣ UX / Shell (Optional)
**Packages:** zsh, fish, tmux, htop, ncdu
```bash
pkg install -y zsh fish tmux htop ncdu
```

## 4️⃣ Recon / Networking (Optional)
**Packages:** wget, net-tools, openssh, socat, tcpdump
```bash
pkg install -y wget net-tools openssh socat tcpdump
```

## 5️⃣ Pentest (Optional)
**Packages:** nmap, hydra, sqlmap, john, aircrack-ng, ettercap
```bash
pkg install -y nmap hydra sqlmap john aircrack-ng ettercap
```

## 6️⃣ Utils (Optional)
**Packages:** unzip, zip, rsync, openssl, proot-distro
```bash
pkg install -y unzip zip rsync openssl proot-distro
```

## 7️⃣ Fun (Optional)
**Packages:** figlet, cowsay + lolcat (pip)
```bash
pkg install -y figlet cowsay
pip3 install --no-input lolcat || pip install --no-input lolcat || true
```

## 8️⃣ Python Libraries (pip / pip2)
**Libraries:** requests, mechanize, beautifulsoup4, futures, rich, urllib3, paramiko, tqdm, flask, fastapi, cryptography
```bash
pip3 install --no-input requests mechanize beautifulsoup4 futures rich urllib3 paramiko tqdm flask fastapi cryptography || true
if command -v pip2 >/dev/null 2>&1; then pip2 install --no-input requests mechanize beautifulsoup4 futures rich urllib3 paramiko tqdm flask fastapi cryptography || true; fi
```

## Quick Combo Examples
**Basic (Core + Fun)**
```bash
pkg install -y git curl bash coreutils python python2 python2-dev python3 nano tar figlet cowsay
pip3 install --no-input requests lolcat || true
```

**Full (All Groups)**
```bash
pkg update -y && pkg upgrade -y
pkg install -y git curl bash coreutils python python2 python2-dev python3 nano tar clang make cmake pkg-config nodejs golang openjdk-17 zsh fish tmux htop ncdu wget net-tools openssh socat tcpdump nmap hydra sqlmap john aircrack-ng ettercap unzip zip rsync openssl proot-distro figlet cowsay
pip3 install --no-input requests mechanize beautifulsoup4 futures rich urllib3 paramiko tqdm flask fastapi cryptography || true
if command -v pip2 >/dev/null 2>&1; then pip2 install --no-input requests mechanize beautifulsoup4 futures rich || true; fi
```

---
