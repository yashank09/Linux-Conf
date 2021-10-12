#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi
if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi
if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --output eDP-1 --off --output HDMI-1-0 --auto
nvidia-settings --assign CurrentMetaMode="nvidia-auto-select +0+0 { ForceFullCompositionPipeline = On }"

picom --experimental-backends --no-fading-openclose &
(sleep 15s && xset r rate 230 25) &
~/.fehbg &
pipewire &
pipewire-pulse &
pipewire-media-session &

while true; do
	dwm >/dev/null 2>&1
done

exec dwm
