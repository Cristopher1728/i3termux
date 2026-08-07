#!/bin/bash
# Creador: Cristhian Gabriel BONILLA BARRIOS <cristiano1728@gmail.com>
# Script que instala paquetes adicionales y pre-configura i3wm en Debian y Derivados.
#==============================================================\

#Iniciando Instalación . . .
echo -e "\e[1;37;45m* 🌍 ┼┼┼ >> Iniciando Instalación de paquetes Necesarios . . . \e[1;39;49m"

termux-setup-storage
pkg update && pkg upgrade -y
#Instalación Paquetes Necesarios
pkg install x11-repo -y
pkg update
pkg install xfce4 i3 tigervnc fecha tilix firefox fastfetch vim htop w3m sc-im mc rofi lxappearance papirus-icon-theme cmatrix htop xarchiver pcmanfm curl -y

mkdir -p ~/.config
mkdir -p /data/data/com.termux/files/usr/share/rofi
rm -rf *.rasi /data/data/com.termux/files/usr/share/rofi/themes
cp -r themes /data/data/com.termux/files/usr/share/rofi
cp -r rofi ~/.config

mkdir /data/data/com.termux/files/home/.config
mkdir /data/data/com.termux/files/home/.config/i3
mv config /data/data/com.termux/files/home/.config/i3

cd backgrounds/
mv *.* /data/data/com.termux/files/usr/share/backgrounds/
cd ..
mkdir /data/data/com.termux/files/home/.config/nitrogen
mv bg-saved.cfg nitrogen.cfg /data/data/com.termux/files/home/.config/nitrogen


echo -e "\e[1;37;45m* 🌎 ┼─┼┼┼─>> Integrando comandos en el archivo bash.bashrc. . . \e[1;39;49m"
echo "


export PS1='\[\033[01;35m\][\u\[\033[01;33m\]㉿\[\033[01;34m\]\@][\[\033[01;33m\]\w\[\033[01;34m\]]\[\033[01;32m\]\$\n┼┼》\[\033[01;37m\]'

clear
fastfetch
alias sh1='cd $PREFIX/etc && nano -l bash.bashrc'
alias up='pkg upd && pkg upg -y'
alias fa='clear && fastfetch'
alias x='exit'
alias i='cd ~ && ls -l'
alias xfc='vncserver :1 -geometry 1280x720;export DISPLAY=:1;startxfce4 &'
alias i3='vncserver :1 -geometry 1280x720;export DISPLAY=:1;i3 &'
alias kill='vncserver -kill :1'

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
kill = Cierra Entorno Gráfico Actual
====================================================='" >> $PREFIX/etc/bash.bashrc

clear
fastfetch
echo -e "\e[1;37;45m* 🌎 ┼─┼┼┼─>> Instalación Finalizada, Disfrute del Sistema y Aplicaciones Instalados . . . \e[1;39;49m"
