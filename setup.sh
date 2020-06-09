#!/bin/bash
################ SETUP SCRIPT FOR PENTEST MANJARO ###########

# Install stuff
sudo pacman -Syyu
sudo pacman -S yay
sudo yay -S go docker burpsuite virtualbox chromium visual-studio-code-bin goland python2-pip python-pip \ 
            discord lsd binwalk qbittorrent android-sdk-build-tools vim nmap proxychains-ng hashcat \
            opencl-amdgpu-pro-orca phpstorm intellij-idea-ultimate-edition zsh git curl

# Enable fstrim
systemctl enable fstrim.timer

# Disable CPU mitigations (please don't root me)
sed -i 's/^GRUB_CMDLINE_LINUX_DEFAULT="/&mitigations=off /' /etc/default/grub
sudo update-grub

mkdir -p ~/ctf/tools
cd ~/ctf/tools
git clone https://github.com/deltaclock/dirbuster-lists.git
git clone https://github.com/danielmiessler/SecLists.git
wget https://raw.githubusercontent.com/rebootuser/LinEnum/master/LinEnum.sh && mv LinEnum.sh linenum.sh
wget https://gist.githubusercontent.com/deltaclock/ff1d639f2406a14756c57f2399e0ea17/raw/db4aa8d2d3b3d934f820916bfc68def49c013865/sh.perl
wget https://github.com/DominicBreuker/pspy/releases/download/v1.2.0/pspy32
wget https://github.com/DominicBreuker/pspy/releases/download/v1.2.0/pspy64


python -m pip install --user wfuzz frida-tools objection

# SETUP ZSH
cd ~/delta-manjaro
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sed -i 's/_THEME=\"robbyrussell\"/_THEME=\"pygmalion\"/g' ~/.zshrc
echo '[[ -f ~/.config/zsh/zsh.conf ]] && source ~/.config/zsh/zsh.conf' >> ~/.zshrc
cp -r zsh/ ~/.config/
cp -r scripts/ ~/

mkdir -p ~/Pictures/Screenshots

go get github.com/OJ/gobuster && go install github.com/OJ/gobuster

# VMS
cd ~/Downloads
# wget http://releases.ubuntu.com/19.04/ubuntu-19.04-live-server-amd64.iso
# wget https://ftp.cc.uoc.gr/mirrors/linux/parrot/iso/4.9.1/Parrot-security-4.9.1_x64.iso
# wget https://az792536.vo.msecnd.net/vms/VMBuild_20180102/VirtualBox/IE11/IE11.Win7.VirtualBox.zip
# wget https://az792536.vo.msecnd.net/vms/VMBuild_20190311/VirtualBox/MSEdge/MSEdge.Win10.VirtualBox.zip
# unzip IE11.Win7.VirtualBox.zip && unzip MSEdge.Win10.VirtualBox.zip
# rm IE11.Win7.VirtualBox.zip MSEdge.Win10.VirtualBox.zip
echo 'Download your ubuntu, parrot and win10 vms'
mkdir -p ~/Desktop/vm_shares/{parrot,pwn,win7,win10}
