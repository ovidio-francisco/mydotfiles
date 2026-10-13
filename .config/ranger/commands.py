
import json
import os
import shutil
import subprocess

from ranger.api.commands import Command


class set_wallpaper(Command):
    def execute(self):
        source = self.fm.thisfile.path

        if self.arg(1) == "selected":
            image = source
        else:
            folder = os.path.expanduser("~/.config/wallpapers")
            os.makedirs(folder, exist_ok=True)
            image = os.path.join(folder, "theWallpaper")
            shutil.copy2(source, image)

        self.set_background(image)

    def set_background(self, image):
        try:
            if os.environ.get("SWAYSOCK"):
                subprocess.run(
                    ["swaymsg", "output", "*", "bg", image, "fill"], check=True
                )
            elif os.environ.get("HYPRLAND_INSTANCE_SIGNATURE"):
                result = subprocess.run(
                    ["hyprctl", "monitors", "-j"],
                    capture_output=True, text=True, check=True
                )
                for monitor in json.loads(result.stdout):
                    subprocess.run([
                        "hyprctl", "hyprpaper", "wallpaper",
                        f"{monitor['name']}, {image}, fill",
                    ], check=True)
            else:
                subprocess.run(
                    ["i3-msg", "-t", "get_version"],
                    stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL,
                    check=True
                )
                subprocess.run(["feh", "--bg-fill", image], check=True)
        except (OSError, subprocess.CalledProcessError) as error:
            self.fm.notify(f"Could not set wallpaper: {error}", bad=True)


