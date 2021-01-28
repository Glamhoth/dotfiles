#!/bin/bash
FILENAME=~/Pictures/screenshots/"$(ls -1 -t ~/Pictures/screenshots | head -1)"
exec ~/.config/util_scripts/imgur.sh $FILENAME | xclip -selection clipboard
