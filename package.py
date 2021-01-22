import shutil
import os
import json
from configparser import ConfigParser


cf = ConfigParser()
cf.read("config.ini")

print(f"{'='*5} Packaging {cf['DATA']['name']} {'='*5}")

print(" - Copying src => build...")
shutil.rmtree("build", ignore_errors=True)
shutil.copytree("src", "build")

v_mj, v_mn = list(map(int, cf['DATA']['version'].split(".")))
cf['DATA']['version'] = f"{v_mj}.{v_mn+1}"
print(f" - Increasing version to {cf['DATA']['version']}")

print(" - Linting files...")
j_counter, m_counter = 0, 0
for root, dirs, files in os.walk("build"):
    for filename in files:
        with open(file_path := root + os.sep + filename, "r+") as f:
            if filename.endswith(".json"):
                j_counter += 1
                try:
                    j = json.load(f)
                except json.JSONDecodeError as e:
                    print(f"Failed to parse {file_path}:\n    {e.args[0]}")
                    exit(-1)
                contents = json.dumps(j, separators=(',', ':'))
            elif filename.endswith(".mcfunction"):
                m_counter += 1
                lines = [line.rstrip("\r\n") for line in f.readlines()
                         if line and line[0] != "#"]
                contents = "\n".join(lines)
            else:
                continue

            if not contents:
                print(f"   ### Empty file {file_path} ###")

            for kw in cf['DATA']:
                contents = contents.replace(f"#{kw}", cf['DATA'][kw])

            f.seek(0)
            f.write(contents)
            f.truncate()
print(f" - Linted {j_counter} JSON files and {m_counter} MCFunction files...")

zip_name = f"dist/{cf['DATA']['name'].replace(' ','')}_{cf['DATA']['version']}"
print(f" - Zipping contents to {zip_name}.zip...")
shutil.make_archive(zip_name, 'zip', "./build")

print(" - Removing build folder...")
# shutil.rmtree("build")

print(" - Updating config file...")
with open("config.ini", "w") as f:
    cf.write(f, False)
