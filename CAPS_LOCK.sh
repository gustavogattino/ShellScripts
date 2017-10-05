#!/bin/bash
#
# Manda aviso de CAPS LOCK on/off

# icone pra usar na notificacao
icone="/usr/share/icons/NITRUX/devices/48/keyboard.svg"

# verifica se o Caps esta ligado
valor=$(xset q | grep "LED mask" | sed -r "s/.*LED mask:\s+[0-9a-fA-F]+([0-9a-fA-F]).*/\1/")
if [ "$valor" == "0" ]; then
  kdialog  --icon $icone --title "Teclado" --passivepopup "Caps Lock Off" 1
else
  kdialog  --icon $icone --title "Teclado" --passivepopup "Caps Lock On" 1
fi

# Dispara alerta (usar Gnome ou KDE)

# GNOME
#notify-send -i $icone "Caps Lock $saida" -t 1000 

#KDE
#$(sleep .5; echo kdialog  --icon $icone --passivepopup "Caps Lock $saida" --title "Teclado" 1) &