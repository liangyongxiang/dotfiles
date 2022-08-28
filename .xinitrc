
if [ "$DISPLAY" == ":0" ];then
    xrandr --auto
    xrdb -merge ~/.Xresources
fi

if [ -d /etc/X11/xinit/xinitrc.d ]; then
    for f in /etc/X11/xinit/xinitrc.d/*; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

if [ -x /usr/bin/gpg-agent ]; then
    eval "$(/usr/bin/gpg-agent --daemon)"
fi

export TERM=st

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export SDL_IM_MODULE=fcitx
exec fcitx5 &

xset +fp /usr/share/fonts/noto
xset +fp /usr/share/fonts/noto-cjk

exec xbindkeys &
dwm 2> ~/.dwm.log
#exec ck-launch-session dbus-launch --sh-syntax --exit-with-session dwm
session dwm
wmname LG3D
