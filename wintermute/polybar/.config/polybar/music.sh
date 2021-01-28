#!/bin/bash

player_status=$(playerctl -p 'spotify' status 2> /dev/null)
if [[ $? -eq 0 ]]; then
    metadata="$(playerctl -p 'spotify' metadata artist) - $(playerctl -p 'spotify' metadata title) - $(playerctl -p 'spotify' metadata album)"
fi

if [[ $player_status = "Playing" ]]; then
    echo " %{F#ffffff}$metadata"
elif [[ $player_status = "Paused" ]]; then
    echo " %{F#555555}$metadata"
else
    echo ""
fi
