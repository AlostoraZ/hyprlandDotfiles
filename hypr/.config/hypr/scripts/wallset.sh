#!/bin/zsh

rm /home/alostora/.currentwallpaper

img=$1

swww img "$img" --transition-type=bottom --transition-step=50 --transition-fps=144
sleep 1
matugen image "$img" &> /dev/null

ln -s $img /home/alostora/.currentwallpaper

