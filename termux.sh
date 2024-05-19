termux-setup-storage
pkg update && pkg -y upgrade
pkg install ruby wget fastfetch vim htop w3m sc mc cmatrix -y
wget https://github.com/busyloop/lolcat/archive/master.zip
unzip master.zip
cd lolcat-master/bin
gem install lolcat

echo "


clear
fastfetch |lolcat -as 500
alias sh1='cd $PREFIX/etc && nano bash.bashrc'
alias up='pkg upd && pkg upg -y'
alias ne='clear && fastfetch |lolcat -as 250'
alias x='exit'

alias i='cd ~ && ls -l'" >> $PREFIX/etc/bash.bashrc

clear
cmatrix
fastfetch |lolcat -as 500