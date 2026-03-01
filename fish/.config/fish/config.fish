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
	set -gx PASSWORD_STORE_DIR /mnt/nas/repository/documents/credentials/.password-store

	# Start desktop environment
	# exec niri
	# hyprland &

end

if status is-interactive
    # Commands to run in interactive sessions can go here
	alias mount-repository="sudo mount -t nfs -o vers=4 10.10.0.207:/mnt/access-pool/repository /mnt/nas/repository"
	alias mount-vault="sudo mount -t nfs -o vers=4 10.10.0.207:/mnt/archive-pool/vault /mnt/nas/vault"
	alias mount-collection="sudo mount -t nfs -o vers=4 10.10.0.207:/mnt/archive-pool/collection /mnt/nas/collection"
	# alias mount-server-tailscale="sudo mount -t nfs -o vers=4 (tailscale status | grep server-openwrt | awk '{print $1}'):/mnt/MyFiles /mnt/MyFiles"
end

