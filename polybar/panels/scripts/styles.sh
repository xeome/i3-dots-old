#!/usr/bin/env bash

DIR="$HOME/.config/polybar/panels"

change_panel() {
	# replace config with selected panel
	cat "$DIR"/panel/"${panel}.ini" > "$DIR"/config.ini

	# Restarting polybar
	polybar-msg cmd restart
}

if  [[ "$1" = "--budgie" ]]; then
	panel="budgie"
	change_panel

elif  [[ "$1" = "--deepin" ]]; then
	panel="deepin"
	change_panel

elif  [[ "$1" = "--elight" ]]; then
	panel="elementary"
	change_panel

elif  [[ "$1" = "--edark" ]]; then
	panel="elementary_dark"
	change_panel

elif  [[ "$1" = "--gnome" ]]; then
	panel="gnome"
	change_panel

elif  [[ "$1" = "--klight" ]]; then
	panel="kde"
	change_panel

elif  [[ "$1" = "--kdark" ]]; then
	panel="kde_dark"
	change_panel

elif  [[ "$1" = "--liri" ]]; then
	panel="liri"
	change_panel

elif  [[ "$1" = "--mint" ]]; then
	panel="mint"
	change_panel

elif  [[ "$1" = "--ugnome" ]]; then
	panel="ubuntu_gnome"
	change_panel

elif  [[ "$1" = "--unity" ]]; then
	panel="ubuntu_unity"
	change_panel

elif  [[ "$1" = "--xubuntu" ]]; then
	panel="xubuntu"
	change_panel

elif  [[ "$1" = "--zorin" ]]; then
	panel="zorin"
	change_panel

else
	cat <<- _EOF_
	No option specified, Available options:
	--budgie   --deepin   --elight   --edark   --gnome   --klight
	--kdark   --liri   --mint   --ugnome   --unity   --xubuntu
	--zorin
	_EOF_
fi
