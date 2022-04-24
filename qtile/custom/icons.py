from .utils import read_yaml_file
from os import path


class IconsSingleton():
    ICONS_FILE = path.join(path.expanduser(
        '~'), '.config/qtile/custom/icons.yml')

    def __init__(self):
        self.icons_dict = None
        self.__parse_icons()

    def __parse_icons(self):
        icons_array = read_yaml_file(self.ICONS_FILE)['icons']
        self.icons_dict = {
            icons_array[i]['key']: icons_array[i]['value'] for i in range(len(icons_array))}

    def get(self, key):
        return self.icons_dict[key]


iconsSingleton = IconsSingleton()

if __name__ == "__main__":
    print("linux property", iconsSingleton.get("linux"))
