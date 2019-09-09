#!/bin/bash




DIALOG_CANCEL=1
DIALOG_ESC=255
HEIGHT=0
WIDTH=0



while true; do
  exec 3>&1
  selection=$(dialog \
    --backtitle "DECbox by SPARCie" \
    --title "Menu" \
    --clear \
    --cancel-label "Exit" \
    --menu "Please select system:" $HEIGHT $WIDTH 4 \
    "1" "MicroVAX" \
    "2" "VAX-11" \
    "3" "PDP-10" \
    "4" "PDP-11" \
    "5" "console lines" \
    2>&1 1>&3)
  exit_status=$?
  exec 3>&-
  case $exit_status in
    $DIALOG_CANCEL)
      clear
      echo "Program terminated."
      exit
      ;;
    $DIALOG_ESC)
      clear
      echo "Program aborted." >&2
      exit 1
      ;;
  esac
  case $selection in
    0 )
      clear
      echo "Program terminated."
      ;;
    1 )
      bash uVAX.sh
      ;;
    2 )
      bash VAX11.sh
      ;;
    3 )
      bash PDP10.sh
      ;;
    4 )
      bash PDP11.sh
      ;;
    5 )
      bash conssrv.sh
      ;;
  esac
done
