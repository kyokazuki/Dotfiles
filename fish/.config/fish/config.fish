if status is-login
	# Wayland session declaration
	# set -gx ELECTRON_OZONE_PLATFORM_HINT wayland
	# set -gx GDK_BACKEND wayland
	# set -gx QT_QPA_PLATFORM wayland
	# set -gx MOZ_ENABLE_WAYLAND "1"
	# set -gx XDG_SESSION_TYPE wayland

	# Japanese input method
	set -gx GTK_IM_MODULE fcitx
	set -gx QT_IM_MODULE fcitx
	set -gx XMODIFIERS @im=fcitx
	fcitx5 &

	# User variables
	set -gx EDITOR nvim
	set -gx PASSWORD_STORE_DIR /mnt/MyFiles/ID/.password-store

	# Start desktop environment
	# exec niri
	hyprland &

end

if status is-interactive
    # Commands to run in interactive sessions can go here
	alias mount-server-local="sudo mount -t nfs -o vers=4 10.10.0.1:/mnt/MyFiles /mnt/MyFiles"
	alias mount-server-tailscale="sudo mount -t nfs -o vers=4 (tailscale status | grep server-openwrt | awk '{print $1}'):/mnt/MyFiles /mnt/MyFiles"
end

