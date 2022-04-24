# qtile starting point

## Configuration location

Qtile evaluates locations in this order:

- `$XDG_CONFIG_HOME/qtile/config.py`, if it is set.
- `~/.config/qtile/config.py`

And it reads the module `libqtile.resources.default_config`, included
by default with every Qtile installation.

## Default configuration

What happens when I am updating my config file and I have just write something wrong?

Well, Qtile will load a config file by default, so you can fix the error and try to reload it again.

## Key bindings

The mod key for the default config is __mod4__, which is typically bound to the windows or mac key.

- `mod + k` or `mod + j`: switch windows on the current stack.
- `mod + <space>`: Put focus on the other pane of the stack (when in stack layout).
- `mod + <tab>`: Switch Layouts.
- `mod + w`: Close window.
- `mod + <ctrl> + r`: Reload the config.
- `mod + <group name>`: switch to that group.
- `mod + <shift> + <group name>`: send a window to that group.
- `mod + <enter>`: start a terminal guessed by `libqtile.utils.guess_terminal`.
- `mod + r`: start a little prompt in the bar so users can run arbitrary commands.

## Type of objects

- Lazy Objects
- Groups
- Keys
- Layouts
- Mouse
- Screens
- Hooks
