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

    print("autorandr found in .config...")
    print()
    setups = os.listdir(HOME + CONFIG + RANDR)

    return setups


def asksetup(setups):
    """
    Asks the user for the wanted setup and returns the wanted setup
    """

    print("Choose wanted setup:")

    for x in setups:
        print(x)

    print()
    print("> ", end="")
    userinput = str(input())


    if userinput in setups:
        print(f"{userinput} setup found!")
        cmd = "set"

    else:
        print(f"{userinput} not in setups")
        print(f"Would you like to add {userinput} as the current setup?")
        cmd = "new"

    return cmd, userinput


def setrandr(userinput):
    """
    gets user input and executes the autorandr setup given by the user
    """
    print("Setting the autorandr setup...")


def createrandr(userinput):


    print("Creating new autorandr setup...")



def main():
    setups = getsetups()
    cmd, userinput = asksetup(setups)
    if cmd == "set":
        setrandr(userinput)

    elif cmd == "new":
        createrandr(userinput)

    else:
        print("Error")


if __name__ == "__main__":
    main()
