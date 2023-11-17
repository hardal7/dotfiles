from libqtile import bar, layout, widget, hook
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.command import lazy
import subprocess, os

@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser('~')
    subprocess.Popen([home + '/.config/qtile/battery_check.sh'])
    subprocess.Popen([home + '/.config/qtile/startup.sh'])


mod = "mod4"
terminal = "kitty"

keys = [
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),

    Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
   
    Key([mod, "control"], "h", lazy.layout.grow_left(), lazy.layout.shrink(), desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(), lazy.layout.grow(), desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(),desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),

    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config file"),
    Key([mod], "n", lazy.layout.reset(), desc="Reset all window sizes"),
    Key([mod], "f", lazy.window.toggle_fullscreen(), desc ="Toggle fullscreen"),
    
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    Key([mod], "w", lazy.spawn("firefox"), desc="Launch firefox"),
    Key([mod], "s", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "q", lazy.window.kill(), desc="Kill focused window"),
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod], "d", lazy.spawn("rofi -show drun"), desc="Spawn rofi"),
    Key([mod], "c", lazy.spawn("rofi -modi 'clipboard:greenclip print' -show clipboard -run-command '{cmd}'"), desc="Spawn clipboard"),
    Key([], "Print", lazy.spawn("flameshot gui"), desc="Screenshot"),

    
    Key([], "XF86AudioLowerVolume", lazy.spawn("amixer -D pulse sset Master 5%-"), desc="Decrease volume"),
    Key([], "XF86AudioRaiseVolume", lazy.spawn("amixer -D pulse sset Master 5%+"), desc="Increase volume"),
    Key([], "XF86AudioMute", lazy.spawn("amixer sset Master toggle"), desc="Mute audio"),
    Key([], "XF86MonBrightnessDown", lazy.spawn("brightnessctl set 25-"), desc="Decrease brightness"),
    Key([], "XF86MonBrightnessUp", lazy.spawn("brightnessctl set +25"), desc="Increase brightness"),
    Key([], "XF86AudioPlay", lazy.spawn("playerctl play-pause"), desc='Play/Pause'),
    Key([], "XF86AudioPrev", lazy.spawn("playerctl previous"), desc='Play Previous'),
    Key([], "XF86AudioNext", lazy.spawn("playerctl next"), desc='Play Next'),
]

groups = [
        Group("1", label = ""),
        Group("2", label = "", matches=[Match(wm_class=["firefox"])]),
        Group("3", label = "", matches=[Match(wm_class=["discord"])]),
        Group("4", label = "", matches=[Match(wm_class=["spotify"])]),
        Group("5", label = "", matches=[Match(title=["latex"])]),

        ]

for i in groups:
    keys.extend([
        Key([mod], i.name, lazy.group[i.name].toscreen()),
        Key([mod], "Tab", lazy.screen.next_group()),
        Key([mod, "shift" ], "Tab", lazy.screen.prev_group()),
        Key([mod, "shift"], i.name, lazy.window.togroup(i.name) , lazy.group[i.name].toscreen()),
    ])

layouts = [
    layout.MonadTall(
        ratio = 0.5,
        margin = (10),
        border_width = 0
        ),
    layout.Max(
        border_width = 0,
        margin = (10)
    ),

]

widget_defaults = dict(
    font="JetBrains Mono",
    fontsize=12,
    padding=8,
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        wallpaper='~/.config/qtile/wallpaper.png',
        wallpaper_mode='fill',
        top=bar.Bar(
            [
                widget.GroupBox(highlight_method = "text", fontsize = 16, urgen_border = "#00000000", this_current_screen_border = "#6F6FED"),
                widget.Spacer(),
                # widget.Mpris2(display_metadata = ['xesam:title', 'xesam:artist']),
                widget.Spacer(),
                widget.Clock(format = "%b %d, %H:%M", foreground = "#A0A8CD"),
            ],
            30,
            margin = [10,10,0,10],
            background="#0D0D15",
        ),
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

wmname = "qtile"
