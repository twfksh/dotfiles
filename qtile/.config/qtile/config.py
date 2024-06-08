#   Qtile Configuration
#   Author: Toufiq A. Shishir
#   Date  : 2024-06-08 Sat 12:36 AM


import os
import subprocess

from libqtile import bar, hook, layout, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen, hook
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal

# Variables
mod, mod1, mod2 = "mod4", "alt", "control"
home = os.path.expanduser("~")
browser, file_manager = "brave", "thunar"
terminal = guess_terminal()


# COLORS Specs
def init_colors():
    return [
        ["#232A2E", "#232A2E"],  # bg_dim
        ["#343F44", "#343F44"],  # bg1
        ["#D3C6AA", "#D3C6AA"],
        ["#E67E80", "#E67E80"],
        ["#83c092", "#83c092"],  # aqua
        ["#E69875", "#E69875"],
        ["#7FBBB3", "#7FBBB3"],
        ["#D699B6", "#D699B6"],
        ["#46d9ff", "#46d9ff"],
        ["#a9a1e1", "#a9a1e1"],
        ["#7A8478", "#7A8478"],
    ]


colors = init_colors()


# KEYBINDING Specs
keys = [
    # Change focus
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),
    # Move windows
    Key(
        [mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"
    ),
    Key(
        [mod, "shift"],
        "l",
        lazy.layout.shuffle_right(),
        desc="Move window to the right",
    ),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    # Grow/Shrink focused windows
    Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key(
        [mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"
    ),
    Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    # Toggle between split and unsplit sides of stack
    Key(
        [mod, "shift"],
        "Return",
        lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack",
    ),
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "q", lazy.window.kill(), desc="Kill focused window"),
    Key(
        [mod],
        "f",
        lazy.window.toggle_fullscreen(),
        desc="Toggle fullscreen on the focused window",
    ),
    Key(
        [mod],
        "t",
        lazy.window.toggle_floating(),
        desc="Toggle floating on the focused window",
    ),
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod], "r", lazy.spawncmd(), desc="Spawn a command using a prompt widget"),
    # Custom keybindings
    Key(
        [],
        "XF86AudioRaiseVolume",
        lazy.spawn("pactl set-sink-volume 0 +5%"),
        desc="Volume Up",
    ),
    Key(
        [],
        "XF86AudioLowerVolume",
        lazy.spawn("pactl set-sink-volume 0 -5%"),
        desc="volume down",
    ),
    Key(
        [], "XF86AudioMute", lazy.spawn("pulsemixer --toggle-mute"), desc="Volume Mute"
    ),
    Key([], "XF86AudioPlay", lazy.spawn("playerctl play-pause"), desc="playerctl"),
    Key([], "XF86AudioPrev", lazy.spawn("playerctl previous"), desc="playerctl"),
    Key([], "XF86AudioNext", lazy.spawn("playerctl next"), desc="playerctl"),
    # Key([], "XF86MonBrightnessUp", lazy.spawn("brightnessctl s 10%+"), desc='brightness UP'),
    # Key([], "XF86MonBrightnessDown", lazy.spawn("brightnessctl s 10%-"), desc='brightness Down'),
    Key([mod], "b", lazy.spawn(browser), desc="browser"),
    Key([mod], "d", lazy.spawn("rofi -show drun"), desc="file manager"),
    Key([mod], "e", lazy.spawn(file_manager), desc="file manager"),
    # Key([mod], "h", lazy.spawn("roficlip"), desc='clipboard'),
    Key([mod], "s", lazy.spawn("flameshot gui"), desc="Screenshot"),
]


# GROUPS Specs
groups = [Group(i) for i in "123456789"]

for i in groups:
    keys.extend(
        [
            # mod + group number = switch to group
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name),
            ),
            # mod + shift + group number = switch to & move focused window to group
            Key(
                [mod, "shift"],
                i.name,
                lazy.window.togroup(i.name, switch_group=True),
                lazy.group[i.name].toscreen(),
                desc="Switch to & move focused window to group {}".format(i.name),
            ),
            # mod1 + tab switch to next group
            Key(["mod1"], "Tab", lazy.screen.next_group()),
            # mod1 + shift + tab switch to previous group
            Key(["mod1", "shift"], "Tab", lazy.screen.prev_group()),
        ]
    )


# LAYOUTS Specs
def init_layout_theme():
    return {
        "margin": 5,
        "single_margin": None,
        "border_width": 1,
        "single_border_width": None,
        "border_focus": colors[4],
        "border_normal": colors[1],
    }


layout_theme = init_layout_theme()

layouts = [
    # layout.MonadTall(margin=8, border_width=2, border_focus="#5e81ac", border_normal="#4c566a"),
    layout.MonadTall(**layout_theme),
    # layout.Columns(**layout_theme),
    # layout.MonadWide(margin=8, border_width=2, border_focus="#5e81ac", border_normal="#4c566a"),
    layout.MonadWide(**layout_theme),
    layout.Matrix(**layout_theme),
    # layout.Bsp(**layout_theme),
    # layout.Floating(**layout_theme),
    # layout.RatioTile(**layout_theme),
    # layout.Max(**layout_theme)
]


# BAR/WIDGETS Specs
widget_defaults = dict(
    font="Iosevka",
    fontsize=14,
    padding=4,
    background=colors[0],
)
extension_defaults = widget_defaults.copy()


def init_widgets_list():
    widgets_list = [
        widget.Sep(
            linewidth=0,
            padding=4,
            foreground=colors[1],
            background=colors[1],
        ),
        widget.Image(
            filename="~/.config/qtile/icons/archlinux_green.png",
            scale="False",
            margin=3,
            foreground=colors[2],
            background=colors[1],
            mouse_callbacks={"Button1": lazy.spawn("rofi -show drun")},
        ),
        widget.Sep(linewidth=0, padding=18, foreground=colors[1], background=colors[1]),
        widget.GroupBox(
            font="Iosevka",
            fontsize=14,
            margin_y=3,
            margin_x=0,
            padding_y=5,
            padding_x=3,
            borderwidth=3,
            active=colors[4],
            inactive=colors[2],
            rounded=True,
            highlight_color=colors[1],
            highlight_method="line",
            this_current_screen_border=colors[4],
            other_current_screen_border=colors[4],
            foreground=colors[2],
            background=colors[1],
        ),
        widget.TextBox(
            text="|",
            font="Iosevka",
            background=colors[1],
            foreground=colors[2],
            padding=0,
            fontsize=50,
        ),
        widget.CurrentLayoutIcon(
            custom_icon_paths=[os.path.expanduser("~/.config/qtile/icons")],
            background=colors[1],
            padding=3,
            scale=0.45,
        ),
        widget.CurrentLayout(
            foreground=colors[7],
            background=colors[1],
            padding=5,
        ),
        widget.TextBox(
            text="|",
            font="Iosevka",
            background=colors[1],
            foreground=colors[2],
            padding=0,
            fontsize=50,
        ),
        widget.WindowName(
            foreground=colors[2],
            background=colors[1],
            padding=2,
        ),
        # #####
        # widget.TextBox(
        #     text="",
        #     background=colors[1],
        #     foreground=colors[2],
        #     padding=0,
        #     fontsize=50,
        # ),
        # widget.CPU(
        #     foreground=colors[0],
        #     background=colors[2],
        # ),
        # widget.TextBox(
        #     text="",
        #     background=colors[2],
        #     foreground=colors[1],
        #     padding=0,
        #     fontsize=50,
        # ),
        #####
        widget.TextBox(
            text="",
            background=colors[1],
            foreground=colors[2],
            padding=0,
            fontsize=50,
        ),
        widget.Net(
            foreground=colors[0],
            background=colors[2],
            format=" {down:.0f}{down_suffix}   {up:.0f}{up_suffix}",
        ),
        widget.TextBox(
            text="",
            background=colors[2],
            foreground=colors[1],
            padding=0,
            fontsize=50,
        ),
        #####
        widget.TextBox(
            text="",
            background=colors[1],
            foreground=colors[5],
            padding=0,
            fontsize=50,
        ),
        widget.CPU(
            foreground=colors[0],
            background=colors[5],
            # format="  {temp:.1f}{unit} ",
        ),
        widget.Sep(linewidth=0, padding=0, background=colors[5]),
        widget.TextBox(
            text="",
            background=colors[5],
            foreground=colors[1],
            padding=0,
            fontsize=50,
        ),
        #####
        widget.TextBox(
            text="",
            background=colors[1],
            foreground=colors[6],
            padding=0,
            fontsize=50,
        ),
        widget.Volume(
            foreground=colors[0],
            background=colors[6],
            fmt="VOL: {}",
            emoji=False,
            emoji_list=[" ", " ", " ", " "],
        ),
        widget.TextBox(
            text="",
            background=colors[6],
            foreground=colors[1],
            padding=0,
            fontsize=50,
        ),
        #####
        widget.TextBox(
            text="",
            background=colors[1],
            foreground=colors[4],
            padding=0,
            fontsize=50,
        ),
        widget.Clock(
            foreground=colors[1], background=colors[4], format="%d %b, %a %I:%M %p"
        ),
        widget.TextBox(
            text="",
            background=colors[4],
            foreground=colors[1],
            padding=0,
            fontsize=50,
        ),
        widget.Sep(linewidth=0, padding=0, background=colors[4]),
        #####
        widget.TextBox(
            text="",
            background=colors[1],
            foreground=colors[3],
            padding=0,
            fontsize=50,
        ),
        widget.Image(
            filename="~/.config/qtile/icons/on-off-button.png",
            scale="False",
            margin=8,
            foreground=colors[2],
            background=colors[3],
            mouse_callbacks={
                "Button1": lazy.spawn("bash -c '~/.config/rofi/scripts/power'")
            },
        ),
        widget.Sep(linewidth=0, padding=0, background=colors[3]),
    ]
    return widgets_list


widgets_list = init_widgets_list()

# BAR Configuration
screens = [
    Screen(
        top=bar.Bar(
            widgets_list,
            30,
            background="#232a2e",
            border_color="#83c092",
            border_width=[0, 0, 0, 0],
            margin=[0, 0, 0, 0],
        ),
        # You can uncomment this variable if you see that on X11 floating resize/moving is laggy
        # By default we handle these events delayed to already improve performance, however your system might still be struggling
        # This variable is set to None (no cap) by default, but you can set it to 60 to indicate that you limit it to 60 events per second
        # x11_drag_polling_rate = 60,
    ),
]


# EXTRA Configs
# Drag floating layouts.
mouse = [
    Drag(
        [mod],
        "Button1",
        lazy.window.set_position_floating(),
        start=lazy.window.get_position(),
    ),
    Drag(
        [mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()
    ),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
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


# Autostart script
@hook.subscribe.startup_once
def autostart():
    subprocess.call([os.path.expanduser("~/.config/qtile/autostart_once.sh")])


auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None

# xcursor theme (string or None) and size (integer) for Wayland backend
wl_xcursor_theme = None
wl_xcursor_size = 24

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
