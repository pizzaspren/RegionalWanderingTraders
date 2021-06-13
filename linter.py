import json
import pathlib
from typing import IO, List
from configparser import ConfigParser

from rwtlt_parser import read_table_from_file


def parse_json_file(f: IO[str]) -> str:
    try:
        j = json.load(f)
    except json.JSONDecodeError as e:
        print(f"Failed to parse {f}:\n    {e.args[0]}")
        exit(-1)
    return json.dumps(j, separators=(',', ':'))


def parse_mc_file(f: IO[str], debug: bool) -> str:

    def parse_trim(lines: List[str]) -> List[str]:
        return [line.rstrip("\r\n") for line in lines]

    def parse_comments(lines: List[str]) -> List[str]:
        return [line for line in lines if line and not line.startswith("#")]

    def parse_debug(lines: List[str]) -> List[str]:
        parsed_lines = []
        skipline = False
        for line in lines:
            if line.startswith("#debug"):
                skipline = True
                if len(debug_args := line.split()) > 1:
                    skipline = debug_args[1] == "on"
                continue
            elif not skipline:
                parsed_lines.append(line)
        return parsed_lines

    def parse_fold(lines: List[str]) -> List[str]:
        parsed_lines = []
        for line in lines:
            if line.startswith("#fold"):
                last_line = parsed_lines.pop()
                folded_line = "".join([
                    last_line[:-1],
                    line.lstrip("#fold").strip().rstrip("\r\n"),
                    last_line[-1]
                    ])
                parsed_lines.append(folded_line)
            else:
                parsed_lines.append(line)
        return parsed_lines

    lines = f.readlines()
    lines = parse_trim(lines)
    lines = parse_fold(lines)
    if not debug:
        lines = parse_debug(lines)
    lines = parse_comments(lines)
    return "\n".join(lines)


def lint(path: str, cf: ConfigParser) -> None:
    debug = cf["CONFIG"].getboolean("debug")
    j_counter, m_counter = 0, 0
    for file in pathlib.Path(path).rglob("*"):
        print(file)
        if file.is_dir():
            continue
        with file.open() as f:
            if file.suffix == ".json":
                j_counter += 1
                contents = parse_json_file(f)
            elif file.suffix == ".rwtlt":
                j_counter += 1
                contents = read_table_from_file(f)
            elif file.suffix in [".mcfunction", ".mcmeta"]:
                m_counter += file.suffix == ".mcfunction"
                contents = parse_mc_file(f, debug)
            else:
                continue

            if not contents:
                print(f"   ### Empty file {file.name} ###")

            for kw in cf['DATA']:
                contents = contents.replace(f"#{kw}", cf['DATA'][kw])

        if file.suffix == ".rwtlt":
            # Rename file to .json, as contents are changing format
            # and rwtlt file should not be distributed
            file = file.rename(file.with_suffix(".json"))
        file.write_text(contents)

    print(f" - Linted {j_counter} JSON, {m_counter} MCFunction...")
