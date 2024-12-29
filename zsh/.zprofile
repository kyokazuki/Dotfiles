# Check if not SSH login (i.e., local login)
if [[ -z "$SSH_CONNECTION" ]]; then
    # start hyprland for local login
    hyprland &
fi
