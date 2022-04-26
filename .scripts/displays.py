#!/bin/python3

"""
Display a prompt of all of the autorandr options you have and
let you choose which one to use
Excpects config files to be at /home/USER/.config/

Dependencies: autorandr
TODO support for adding new setups
"""

import subprocess as s  # for getstatusoutput aka exec command in terminal
import os               # for scanning directories

# glob variable names of path to autorandr conf
# ie (/home/USER/)(.config/)(autorandr/)
HOME = s.getstatusoutput("echo $HOME")[1] + "/"
CONFIG = ".config/"
RANDR = "autorandr/"


def getsetups():
    """
    scans .config dir for autorandr monitor setups
    """

    if not os.path.isdir(HOME + CONFIG):
        print(".config dir not found in home dir")
        return

    if not os.path.isdir(HOME + CONFIG + RANDR):
        print("no autorandr in .config")
        return

    print("autorandr found in .config")
    setups = os.listdir(HOME + CONFIG + RANDR)
    for config in setups:
        print(config)

    return setups


def main():
    print(HOME)
    print(CONFIG)
    print()

    getsetups()


if __name__ == "__main__":
    main()
