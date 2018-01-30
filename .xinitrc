# Set toggle between langs
setxkbmap -option grp:switch,grp:alt_shift_toggle,grp_led:scroll us,bg -variant ,phonetic &

# Set wallpaper
exec feh --bg-scale $HOME/arch-wallpaper.jpg &

# Start wm
exec i3 -l
