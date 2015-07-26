#!/bin/bash
i3status --config ~/.i3status.conf | while :
do
    read line
    LG=$(setxkbmap -query | awk '/layout/{print $2}')
    #LG=${setxkbmap -print | awk -F'+' '/xkb_symbols/ {print $2}'}
    #LG=$(setxkbmap -print | awk -F'+' '/xkb_symbols/ {print $2}')

    dat="[{ \"full_text\": \" LANG:$LG\", \"color\":\"#10E00\" },"
    echo "${line/[/$dat}" || exit 1
done
