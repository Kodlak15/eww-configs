#!/usr/bin/env nix-shell
#! nix-shell -i python3
#! nix-shell -p python311Packages.lxml

import xml.etree.ElementTree as ET
import os
from lxml import etree
from pathlib import Path

def recolor(element, color):
    for child in element:
        child.set("style", f"stop-color:{color};stop-opacity:1")


if __name__ == "__main__":
    tree = etree.parse("./nix-snowflake.svg")
    root = tree.getroot()
    namespaces = {'svg': 'http://www.w3.org/2000/svg'}
    e1 = root.find(f".//*[@id='linearGradient5562']")
    e2 = root.find(f".//*[@id='linearGradient5053']")

    home = str(Path.home())
    colors = os.path.join(home, ".cache/wal/colors")
    with open(colors, "r") as f:
        colors = dict(enumerate(f.readlines()))

    recolor(e1, colors[12])
    recolor(e2, colors[6])
    
    tree.write("./nix-snowflake-pywal.svg")
