#!/bin/bash
# MergerFS Installer/Updater by Xan#7777

if pgrep "mergerfs";
then
    echo "mergerfs is running. Please close all mergerfs instances before proceeding."
    exit 0
fi
clear
echo "Which version of mergerfs do you want to install?"
echo "1 = 2.28.3"
echo "2 = latest (2.31)"
read -r -p "Please select between 1 or 2: " mfs
clear
if [ "$mfs" = "1" ];
then
    echo "mergerfs is installing/upgrading..."
    mkdir -p "$HOME"/.mergerfs-tmp/
    wget https://github.com/trapexit/mergerfs/releases/download/2.28.3/mergerfs_2.28.3.debian-stretch_amd64.deb -O "$HOME"/.mergerfs-tmp/mergerfs.deb
    rm -rf "$HOME"/bin/*mergerfs*
    dpkg -x "$HOME"/.mergerfs-tmp/mergerfs.deb "$HOME"/.mergerfs-tmp
    cp "$HOME"/.mergerfs-tmp/usr/bin/* "$HOME"/bin
elif [ "$mfs" = "2" ];
then
    echo "mergerfs is installing/upgrading..."
    mkdir -p "$HOME"/.mergerfs-tmp/
    wget https://github.com/trapexit/mergerfs/releases/download/2.31.0/mergerfs_2.31.0.debian-stretch_amd64.deb -O "$HOME"/.mergerfs-tmp/mergerfs.deb
    rm -rf "$HOME"/bin/*mergerfs*
    dpkg -x "$HOME"/.mergerfs-tmp/mergerfs.deb "$HOME"/.mergerfs-tmp
    cp "$HOME"/.mergerfs-tmp/usr/bin/* "$HOME"/bin
fi

clear

if [[ $("$HOME"/bin/mergerfs -V) ]]; then
    echo "MergerFS installed correctly! Restart your SSH session to properly apply changes!"
    rm -rf "$HOME"/.mergerfs-tmp
    exit 1
else
    echo "mergerfs install somehow failed. Please run this again!"
    rm -rf "$HOME"/.mergerfs-tmp
    exit 2
fi