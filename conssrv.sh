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
    --menu "Please select port:" $HEIGHT $WIDTH 4 \
    "1" "COM1" \
    "2" "COM2" \
    "3" "COM3" \
    "4" "COM4" \
    "5" "COM5" \
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
      sudo minicom -D /dev/ttyS0
      ;;
    2 )
      sudo minicom -D /dev/ttyS1
      ;;
    3 )
      sudo minicom -D /dev/ttyS2
      ;;
    4 )
      sudo minicom -D /dev/ttyS3
      ;;
    5 )
      sudo minicom -D /dev/ttyS4
      ;;
  esac
done
