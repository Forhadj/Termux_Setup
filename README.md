# FORHAD Termux Setup Tool

[![Telegram](https://img.shields.io/badge/Telegram-@f_forhad-blue)](https://t.me/f_forhad)
[![GitHub](https://img.shields.io/badge/GitHub-Forhadj-black)](https://github.com/Forhadj)

## ⚙️ Overview

**FORHAD Termux Setup Tool** 
```
pkg update -y && pkg upgrade -y
pkg install python -y
pkg install git -y
pkg install wget curl unzip tar -y 
pkg install clang make -y
pip install --upgrade pip
pip install requests bs4 lxml rich httpx

git clone https://github.com/Forhadj/Termux_Setup.git
cd Termux_Setup
chmod +x Forhad.py
python Forhad.py
