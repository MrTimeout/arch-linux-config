from .utils import read_yaml_file
from os import path, strerror
from errno import ENOENT


class ThemeSingleton():
    THEME_FOLDER = path.join(path.expanduser('~'), ".config/qtile/themes/")
    EXT_FILE = ".yml"

    def __init__(self):
        self.__parse_themes("dracula")

    def __parse_themes(self, theme_name):
        theme_file_path = path.join(
            self.THEME_FOLDER, theme_name + self.EXT_FILE)
        if not path.exists(theme_file_path):
            raise FileNotFoundError(ENOENT, strerror(ENOENT), theme_file_path)
        colors = read_yaml_file(theme_file_path)['colors']
        self.colors = {colorName: [
            colorValue] * 2 for color in colors for colorName, colorValue in color.items()}

    def get(self, colorName):
        return self.colors[colorName]


themeSingleton = ThemeSingleton()
