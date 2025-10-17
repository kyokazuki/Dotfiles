# Check if not SSH login (i.e., local login)
if [[ -z "$SSH_CONNECTION" ]]; then
    # start desktop environment for local login
    # hyprland &
	niri-session &
fi
