import platform
import subprocess


def do_update():
    pass


def ps_get_version():
    shell = "powershell"
    ver = {}
    min_ver = {
        "maj": 1,
        "min": 8,
        "rev": 1911
    }
    wingetver = subprocess.run(
        "powershell -Command winget -v",
        stdout=subprocess.PIPE
    ).stdout.decode("utf-8")

    ver["maj"] = int(wingetver[1:].split(".")[0])
    ver["min"] = int(wingetver[1:].split(".")[1])
    ver["rev"] = int(wingetver[1:].split(".")[2])

    if ver["rev"] < min_ver["rev"]:
        do_update()

    print(f"detected winget version: v{ver['maj']}.{ver['min']}.{ver['rev']}")


def config_linux():
    shell = "/usr/bin/bash"


def config_windows():
    shell = "powershell"
    ps_get_version()


if __name__ == "__main__":
    current_platform = platform.platform()
    platform_pfx = current_platform.split("-")[0]
    print(f"Detected Platform: {current_platform}")

    if platform_pfx == "Linux":
        print("Linux Detected.")
        config_linux()
    elif platform_pfx == "Windows":
        print("Windows Detected.")
        config_windows()
    else:
        print("Unknown OS.")
        print(f"Platform Prefix: {platform_pfx}")
        print(f"Platform String: {current_platform}")
