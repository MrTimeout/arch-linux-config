from libqtile import widget, bar
from .icons import iconsSingleton
from .themes import themeSingleton


def base(foreground='text', background='dark'):
    return {
        'foreground': themeSingleton.get(foreground),
        'background': themeSingleton.get(background)
    }


def icon(name, foreground='text', background='dark', font_size=16):
    return widget.TextBox(
        **base(foreground, background),
        text=iconsSingleton.get(name),
        padding=3,
        fontsize=font_size
    )


def powerline(foreground='light', background='dark'):
    return widget.TextBox(
        **base(foreground, background),
        text=iconsSingleton.get('powerline'),
        padding=-2,
        fontsize=37
    )


def separator():
    return widget.Sep(
        **base(),
        linewidth=0,
        padding=5
    )


def widgets_arr():
    return [
        widget.GroupBox(
            **base(foreground='light'),
            font='UbuntuMono Nerd Font',
            fontsize=19,
            margin_y=3,
            margin_x=0,
            padding_y=8,
            padding_x=5,
            borderwidth=1,
            # This means that the groupbox is active, which means, that we have already created something inside that workspace.
            active="#FFFFFF",
            # this means that the groupbox is inactive, which means, that we have not already created something inside that workspace.
            inactive="#f90025",
            rounded=False,
            highlight_method='block',
            urgent_alert_method='block',
            # This means that you are using this workspace.
            this_current_screen_border="#6A5882",
            # this_screen_border="#23ed15", # this means that the border has a color when not used.
            disable_drag=True),
        widget.WindowName(
            # This is used to foreground the window name: config.py - Code - OSS
            **base(foreground='focus'),
            # foreground=["#6A5882", "#6A5882"],
            font='UbuntuMono Nerd Font Bold',
            fontsize=14,
            padding=5
        ),
        separator(),
        #powerline('color3', 'color4'),
        icon('network_running', background='color3'),
        widget.Net(
            **base(background='color3'),
            interface='enp4s0',
            padding=5
        ),
        #powerline('color2', 'color3'),
        widget.CurrentLayoutIcon(
            **base(background='color2'),
            scale=0.65
        ),
        widget.CurrentLayout(
            **base(background='color2'),
            padding=5
        ),
        #powerline('color1', 'color2'),
        icon('calendar', background='color1'),
        widget.Clock(
            **base(background='color1'),
            format="%Y-%m-%d %a %I:%M %p"
        )
    ]
