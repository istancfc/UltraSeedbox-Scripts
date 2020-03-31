#!/bin/bash

# rclone Installer/Updater by Xan#7777

if pgrep "rclone";
then
    echo "Rclone is running. Please close all rclone instances before proceeding."
    exit
else
    echo "Installing/Upgrading rclone stable..."
    mkdir -p "$HOME"/.rclone-tmp
    cd "$HOME"/.rclone-tmp || exit
    wget https://downloads.rclone.org/v1.50.2/rclone-v1.50.2-linux-amd64.zip
    unzip rclone-v1.50.2-linux-amd64.zip
    cp "$HOME"/.rclone-tmp/rclone-v1.50.2-linux-amd64/rclone "$HOME"/bin
    cd "$HOME" || exit
    rm -rf "$HOME"/.rclone-tmp
    command -v rclone
    rclone version
fi