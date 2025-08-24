#!/bin/bash
# Creador: Cristhian Gabriel BONILLA BARRIOS <cristiano1728@gmail.com>
# Script que instala paquetes adicionales y pre-configura i3wm en Debian y Derivados.
#==============================================================\

#Iniciando Instalación . . .
echo -e "\e[1;37;45m* 🌎 ┼─┼┼┼─>> Inicinado Instalación de paquetes Necesarios . . . \e[1;39;49m"
termux-setup-storage
pkg update && pkg upgrade -y
#Instalación Paquetes Necesarios
pkg install x11-repo
pkg install xfce4 i3 tigervnc tilix ruby wget fastfetch vim htop w3m sc sc-im mc cmatrix rofi nitrogen lxappearance pipewire vlc-qt papirus-icon-theme cmatrix polybar neofetch htop xarchiver pcmanfm gimp curl -y

#Colocando Password a servidor VNC . . .
echo -e "\e[1;37;45m* 🌎 ┼─┼┼┼─>> Colocando Password a servidor VNC,  . . . \e[1;39;49m"
vncpasswd

#Iniciar el servidor VNC, poner la misma clave VNC, Esto levanta el servidor en localhost:5901 . . .
echo -e "\e[1;37;45m* 🌎 ┼─┼┼┼─>> Iniciar el servidor VNC, poner la misma clave VNC, Esto levanta el servidor en localhost:5901 . . . \e[1;39;49m"
vncserver :1

rm -rf *.rasi /data/data/com.termux/files/usr/share/rofi/themes
mv -f themes /data/data/com.termux/files/usr/share/rofi
mv rofi ~/.config

mkdir /data/data/com.termux/files/home/.config
mkdir /data/data/com.termux/files/home/.config/i3
mv config /data/data/com.termux/files/home/.config/i3

echo -e "\e[1;37;45m* 🌎 ┼─┼┼┼─>> Instalando LOLCAT . . . \e[1;39;49m"
wget https://github.com/busyloop/lolcat/archive/master.zip
unzip master.zip
cd lolcat-master/bin
gem install lolcat

echo -e "\e[1;37;45m* 🌎 ┼─┼┼┼─>> Integrando comandos en el archivo bash.bashrc. . . \e[1;39;49m"
echo "


export PS1='\[\033[01;35m\][\u\[\033[01;33m\]㉿\[\033[01;34m\]\@][\[\033[01;33m\]\w\[\033[01;34m\]]\[\033[01;32m\]\$\n┼┼》\[\033[01;37m\]'

clear
fastfetch |lolcat -as 550
alias sh1='cd $PREFIX/etc && nano -l bash.bashrc'
alias up='pkg upd && pkg upg -y'
alias fa='clear && fastfetch |lolcat -as 550'
alias x='exit'
alias i='cd ~ && ls -l'
alias xfc='vncserver :1;export DISPLAY=:1;startxfce4 &'
alias i3='vncserver :1;export DISPLAY=:1;i3 &'

echo '
=====================================================
Atajo de Comandos
=====================================================
sh1 = Config bash.rc
up = Actualizar Repositorios y Paquetes
fa = Ejecutar Fastfetch
x = salir de terminal (Cttol + d)
i = Dirigirse a la carpeta Home - listado archivos
xfc = Inicia entorno gráfico Xfce En el puerto Localhost:5901
i3 = Inicia entorno gráfico i3wm En el puerto Localhost:5901
=====================================================' |lolcat -as 550" >> $PREFIX/etc/bash.bashrc

clear
cmatrix
fastfetch |lolcat -as 550
echo -e "\e[1;37;45m* 🌎 ┼─┼┼┼─>> Instalación Finalizada, Disfrute del Sistema y Aplicaciones Instalados . . . \e[1;39;49m"
