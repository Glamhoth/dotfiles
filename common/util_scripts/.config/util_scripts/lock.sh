#!/bin/bash

B='#00000000'  # blank
C='#ffffff22'  # clear ish
D='#5299d9ff'  # default
T='#5299d9ff'  # text
W='#ff0000ff'  # wrong
V='#5299d9ff'  # verifying

playerctl pause ;
i3lock                              \
    -c 000000                       \
    -f                              \
    --insidevercolor=#00000000      \
    --ringvercolor=#00000000        \
    \
    --insidewrongcolor=#00000000    \
    --ringwrongcolor=#00000000      \
    \
    --insidecolor=#00000000         \
    --ringcolor=#00000000           \
    --linecolor=#00000000           \
    --separatorcolor=#00000000      \
    \
    --verifcolor=#ffffffff          \
    --wrongcolor=#ff0000ff          \
    --timecolor=#ffffffff           \
    --datecolor=#ffffffff           \
    --keyhlcolor=#00000000          \
    --bshlcolor=#00000000           \
    \
    --screen 1                      \
    --clock                         \
    --timesize=50                   \
    --verifsize=50                  \
    --wrongsize=50                  \
    --layoutsize=50                 \
    --timestr="%H:%M:%S"            \
    --datestr=""                    \
    --veriftext="checking..."       \
    --wrongtext="access denied"     \
    -n; playerctl play
