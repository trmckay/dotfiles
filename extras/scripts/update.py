#!/usr/bin/env python3

from shutil import which
from subprocess import run

class Updater:
    def __init__(self, program: str, command: list):
        self.program = program
        self.command = command

    def __repr__(self):
        return " ".join([
            arg if " " not in arg else f"'{arg}'"
            for arg in self.command
        ])

    def is_installed(self) -> bool:
        return which(self.program) is not None

    def exec(self):
        print(f"Running: {self}")
        run(self.command)

updaters = [
    Updater("dnf", ["sudo", "dnf", "update"]),
    Updater("brew", ["brew", "update"]),
    Updater("brew", ["brew", "upgrade"]),
    Updater("flatpak", ["flatpak", "update"]),
    Updater("nvim", ["nvim", "-c", "PlugClean | PlugUpdate | sleep 3 | qa!"]),
]

for u in updaters:
    if u.is_installed():
        u.exec()
