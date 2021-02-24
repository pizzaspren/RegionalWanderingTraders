import shutil
from configparser import ConfigParser

from linter import lint


cf = ConfigParser()
cf.read("config.ini")

debug = cf["CONFIG"].getboolean("debug")

print(f"{'='*5} Packaging {cf['DATA']['name']} {'(Debug)'*debug} {'='*5}")

print(" - Copying src => build...")
shutil.rmtree("build", ignore_errors=True)
shutil.copytree("src", "build")

v_mj, v_mn = list(map(int, cf['DATA']['version'].split(".")))
cf['DATA']['version'] = f"{v_mj}.{v_mn+1}"
print(f" - Increasing version to {cf['DATA']['version']}")

print(" - Linting files...")
lint("build", cf)

zip_name = "_".join(
    [
        f"dist/{cf['DATA']['name'].replace(' ','')}",
        f"{cf['DATA']['version']}"
    ])
if debug:
    zip_name += "_Debug"
print(f" - Zipping contents to {zip_name}.zip...")
shutil.make_archive(zip_name, 'zip', "./build")

print(" - Removing build folder...")
shutil.rmtree("build")

if not debug:
    print(" - Updating config file...")
    with open("config.ini", "w") as f:
        cf.write(f, False)
