# FORHAD Termux Setup Tool

[![Telegram](https://img.shields.io/badge/Telegram-@f_forhad-blue)](https://t.me/f_forhad)
[![GitHub](https://img.shields.io/badge/GitHub-Forhadj-black)](https://github.com/Forhadj)

## ⚙️ Overview

**FORHAD Termux Setup Tool** is an interactive script designed to provide an easy and fast setup for both new and pro users of Termux and NetHunter. It automatically installs packages and Python modules, showing live `%` progress to track installation in real-time.

- Simple menu-based script
- Termux Core Setup (Group 1)
- NetHunter Essentials (Group 2)
- Python module installation
- Automatic logging
- About & Exit options
- Live progress percentage

---

## 📦 Features

1. **Group 1 — Termux Setup (Core)**  
   - git, curl, bash, coreutils, python, python2, python3, nano, tar, etc.  
   - Python modules: `requests`, `mechanize`, `beautifulsoup4`, `futures`, `rich`, `urllib3`, `paramiko`, `tqdm`, `flask`, `fastapi`, `cryptography`, `lolcat`

2. **Group 2 — NetHunter Essentials (Offshore)**  
   - proot-distro, proot, pulseaudio, termux-api, wget, openssh, resolv-conf, unzip, zip, rsync  
   - Python module: `paramiko`  

3. Interactive menu:  
   - 1️⃣ Termux Setup  
   - 2️⃣ NetHunter Essentials  
   - 3️⃣ About  
   - 4️⃣ Exit  
   - `all` → Install both groups  

4. Live progress percentage for each package and module installation.

5. Logs are stored at: `$HOME/forhad-termux-setup.log`

---

## 🚀 Installation & Usage

1. Clone the repository:

```bash
git clone https://github.com/Forhadj/Termux_Setup.git
cd Termux_Setup

2. Make the script executable:



chmod +x forhad-termux-setup.sh

3. Run the script:



./forhad-termux-setup.sh

4. Follow the interactive menu instructions to install the desired packages.




---

⚡ Notes

Some packages (e.g., proot-distro, pulseaudio, resolv-conf) may not exist in all Termux repositories. If missing, the script will log the failure and continue.

Use responsibly.

The script tracks installation progress for each package and module.



---

📌 Author & Support

Author: Md Forhad
GitHub: https://github.com/Forhadj
Telegram: @f_forhad
