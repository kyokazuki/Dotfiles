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
    Key([mod], "j", lazy.layout.left()),
    Key([mod], "semicolon", lazy.layout.right()),
    Key([mod], "k", lazy.layout.down()),
    Key([mod], "l", lazy.layout.up()),
    Key([mod], "space", lazy.layout.next()),
    # Move windows
    Key([mod, "shift"], "j", lazy.layout.shuffle_left()),
    Key([mod, "shift"], "semicolon", lazy.layout.shuffle_right()),
    Key([mod, "shift"], "k", lazy.layout.shuffle_down()),
    Key([mod, "shift"], "l", lazy.layout.shuffle_up()),
    # Grow windows
    Key([mod, "control"], "j", lazy.layout.grow_left()),
    Key([mod, "control"], "semicolon", lazy.layout.grow_right()),
    Key([mod, "control"], "k", lazy.layout.grow_down()),
    Key([mod, "control"], "l", lazy.layout.grow_up()),
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
    # Key([mod], "Space", lazy.spawn("rofi -show ssh")),
    Key([mod, "control"], "Space", lazy.spawn("bash ~/.config/rofi/power_menu.sh", shell=True)),
    Key([mod, "shift"], "Space", lazy.spawn("bash ~/.config/rofi/passmenu.sh", shell=True)),
]

# Layouts
layouts = [
    layout.Columns(
        border_focus='#C8C093',
        border_normal='#393836',
        border_on_single=True,
        border_width=2,
        insert_position=1,
        margin=0,
        margin_on_single=0,
    )
]
floating_layout = layout.Floating(
    border_focus='#C8C093',
    border_normal='#393836',
    border_width=2,
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(wm_class="pinentry-gtk"), # GPG key password entry 
        Match(wm_class="Pinentry-gtk"), # GPG key password entry 
        Match(title="branchdialog"),  # gitk
    ]
)

# Groups
groups = [Group(name=i, label="") for i in "01234"]
group_keys = ['u','i','o','p','bracketleft']
for i in range(5):
    keys.extend(
        [
            # Switch to group
            Key([mod], group_keys[i], lazy.group[groups[i].name].toscreen()),

            # Switch to & move focused window to group
            Key([mod, "shift"], group_keys[i], lazy.window.togroup(groups[i].name, switch_group=True)),
        ]
    )

# Widgets
widget_defaults = dict(
    font="SauceCodePro Nerd Font",
    fontsize=12,
    foreground='#c5c9c5',
    padding=3,
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        top=bar.Bar(
            [   
                widget.GroupBox(
                    active="#9e9b93",
                    fontsize=11,
                    highlight_method="text",
                    inactive="#282727",
                    margin_x=2,
                    padding_x=5,
                    rounded=True,
                    this_current_screen_border='#98BB6C',
                ),
                # widget.TextBox(fmt='', padding=6),
                # widget.TextBox(fmt='', foreground='#3c3836', padding=6),
                widget.Spacer(length=760),
                widget.Clock(
                    fontsize=12,
                    font="SauceCodePro Nerd Font Bold",
                    format="%Y/%m/%d %a %H:%M",
                ),
                widget.Spacer(),
                widget.Systray(
                    icon_size=16,
                    padding=6,
                ),
                widget.Spacer(length=4),
                # widget.TextBox(fmt='', padding=6),
                # widget.Bluetooth(
                #     default_show_battery=True,
                #     default_text='󰂯',
                #     device_battery_format='({battery}%)',
                #     device_format='{symbol}{name}{battery_level}',
                #     symbol_connected='󰂯',
                #     symbol_paired='',
                #     symbol_powered=('',''),
                # ),
                # widget.TextBox(fmt='', padding=6),
                # widget.PulseVolume(
                #     emoji=True,
                #     emoji_list=['󰸈','󰕿','󰖀','󰕾'],
                #     fontsize=16,
                # ),
                # widget.PulseVolume(
                #     scroll_fixed_width=True,
                #     width=30,
                # ),
                widget.TextBox(fmt='', padding=6),
                widget.TextBox(
                    fmt=' ',
                    fontsize=13,
                ),
                widget.Spacer(length=-4),
                widget.CPU(
                    format='{load_percent}%',
                    markup=True,
                    max_chars=5,
                    scroll_fixed_width=True,
                    update_interval=1.5,
                    width=45,
                ),
                widget.ThermalSensor(
                    format='{temp:.0f}{unit}',
                    scroll_fixed_width=True,
                    tag_sensor='CPUTIN',
                    width=40,
                ),
                widget.Spacer(length=7),
            ],
            20,
            background=["#12120f"],
            # border_width=[0, 0, 1, 0],  # Draw top and bottom borders
            # border_color=["#2e383c", "#2e383c", "#2e383c", "#2e383c"]
        ),
        # wallpaper="~/.config/qtile/sunset.jpg",
        # wallpaper="~/.config/qtile/mountain_kanagawa-dragon.jpg",
        wallpaper="~/.config/qtile/cool_snow_peaks.jpg",
        # https://www.pexels.com/photo/full-moon-behind-mountains-1183021/
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
bring_front_click = True
floats_kept_above = True
cursor_warp = False
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

