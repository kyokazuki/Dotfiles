from libqtile import bar, layout, widget, extension
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal

import os
import subprocess
from libqtile import hook

# Autostart
@hook.subscribe.startup
def autostart():
    home = os.path.expanduser('~/.config/qtile/autostart.sh')
    subprocess.Popen([home])

# Keymap
mod = "mod4"
terminal = guess_terminal()

keys = [
    # Switch between windows
    Key([mod], "h", lazy.layout.left()),
    Key([mod], "l", lazy.layout.right()),
    Key([mod], "j", lazy.layout.down()),
    Key([mod], "k", lazy.layout.up()),
    Key([mod], "space", lazy.layout.next()),
    # Move windows
    Key([mod, "shift"], "h", lazy.layout.shuffle_left()),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right()),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down()),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up()),
    # Grow windows
    Key([mod, "control"], "h", lazy.layout.grow_left()),
    Key([mod, "control"], "l", lazy.layout.grow_right()),
    Key([mod, "control"], "j", lazy.layout.grow_down()),
    Key([mod, "control"], "k", lazy.layout.grow_up()),
    Key([mod, "control"], "n", lazy.layout.normalize()),
    # Applications
    Key([mod], "Return", lazy.spawn(terminal)),    
    Key([mod], "q", lazy.window.kill()),
    # Toggle window mode
    Key([mod], "f", lazy.window.toggle_fullscreen(),),
    Key([mod], "t", lazy.window.toggle_floating(), desc="Toggle floating on the focused window"),
    # Qtile
    Key([mod, "control"], "r", lazy.reload_config()),
    Key([mod, "control"], "q", lazy.shutdown()),
    # Rofi
    Key([mod], "Space", lazy.spawn("rofi -show drun")),
    Key([mod, "control"], "Space", lazy.spawn("bash ~/.config/rofi/power_menu.sh", shell=True)),
    # Key([mod, "shift"], "Space", lazy.spawn("dmenu_run -i -p ' >' -fn 'SauceCodePro Nerd Font-10' -nb '#272e33' -nf '#d3c6aa' -sb '#272e33' -sf '#dbbc7f' -x 140 -z 370")),
]

# Layout
layouts = [
    layout.Columns(
        # border_focus='#d3c6aa',
        border_focus='#dbbc7f',
        border_normal='#272e33',
        border_on_single=False,
        border_width=2,
        insert_position=1,
        margin=0,
        margin_on_single=0,
        ),
]

# Groups
groups = [Group(i) for i in "12345"]
for i in groups:
    keys.extend(
        [
            # Switch to group
            Key([mod], i.name, lazy.group[i.name].toscreen()),
            # Switch to & move focused window to group
            Key([mod, "shift"], i.name, lazy.window.togroup(i.name, switch_group=True)),
        ]
    )

# Widgets
widget_defaults = dict(
    font="SauceCodePro Nerd Font",
    fontsize=13,
    foreground='#d3c6aa',
    padding=3,
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        top=bar.Bar(
            [   
                widget.GroupBox(
                    active="#d3c6aa",
                    block_highlight_text_color="#1e2326",
                    highlight_method="block",
                    inactive="#414b50",
                    margin_x=2,
                    padding_x=5,
                    rounded=True,
                    this_current_screen_border='#dbbc7f',
                ),
                widget.TextBox(fmt=''),
                widget.Spacer(length=735),
                widget.Clock(
                    format="%Y/%m/%d %a %H:%M",
                ),
                widget.Spacer(),
                widget.Systray(
                    icon_size=13,
                ),
                widget.Spacer(length=3),
                # widget.TextBox(fmt=''),
                # widget.Net(
                #     format='󱦳{down:.1f}󱦲{up:.1f}{up_suffix}',
                #     prefix='M',
                #     update_interval=1.5,
                # ),
                widget.TextBox(fmt=''),
                widget.TextBox(
                    fmt=' ',
                    fontsize=13,
                ),
                widget.Spacer(length=-4),
                widget.CPU(
                    format='{load_percent}%',
                    update_interval=1.5,
                ),
                widget.TextBox(fmt=''),
                widget.PulseVolume(
                    emoji=True,
                    emoji_list=['󰸈','󰕿','󰖀','󰕾'],
                    fontsize=15,
                ),
                widget.PulseVolume(),
                widget.Spacer(length=5),
            ],
            20,
            # background="#1e2326",
            background="#272e33",
            # border_width=[0, 0, 2, 0],  # Draw top and bottom borders
            # border_color=["#000000", "#000000", "#d3c6aa", "#000000"]
        ),
        wallpaper="~/.config/qtile/rose.jpg",
        wallpaper_mode="fill",
    ),
]

# Drag floating layouts
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = False
bring_front_click = False
floats_kept_above = True
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ]
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "qtile"
