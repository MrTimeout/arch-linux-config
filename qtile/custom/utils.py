import yaml

def read_yaml_file(path):
    with open(path) as file: return yaml.full_load(file)