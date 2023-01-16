#!/bin/bash

check_if_installed() {
    if pacman -Qs $1 > /dev/null ; then
        return 0
    else
        return 1
    fi
}

apply_config() {
    if check_if_installed $1; then
        echo "* $1"
        stow -Rt ~ $1 2>&1 | grep -v "BUG in find_stowed_path"
    else
        echo "NOT FOUND: $1"
    fi
}

apply_config_no_check() {
    echo "* $1"
    stow -Rt ~ $1 2>&1 | grep -v "BUG in find_stowed_path"
}

common() {
    echo "Applying common configuration..."
    pushd common > /dev/null
        apply_config "dunst"
        apply_config "gtk"
        apply_config "htop"
        apply_config "lazygit"
        apply_config "qt5ct"
        apply_config "ranger"
        apply_config "redshift"
        apply_config "rofi"
        apply_config "vim"
        apply_config "weechat"
        apply_config "zathura"
        apply_config "zsh"
        apply_config_no_check "keyrebind"
        apply_config_no_check "util_scripts"
    popd > /dev/null
}

wintermute() {
    echo "Applying configuration for wintermute..."
    pushd wintermute > /dev/null
        apply_config "compton"
        apply_config "i3"
        apply_config "obs"
        apply_config "polybar"
        apply_config "zsh"
    popd > /dev/null
}

hostname=`hostname`

common
$hostname
