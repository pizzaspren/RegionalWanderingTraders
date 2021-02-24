import json
from typing import IO, List
from os import walk as os_walk, sep as os_sep
from configparser import ConfigParser


def parse_json_file(f: IO[str]) -> str:
    try:
        j = json.load(f)
    except json.JSONDecodeError as e:
        print(f"Failed to parse {f}:\n    {e.args[0]}")
        exit(-1)
    return json.dumps(j, separators=(',', ':'))


def parse_mc_file(f: IO[str]) -> str:

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
    lines = parse_debug(lines)
    lines = parse_comments(lines)
    return "\n".join(lines)


def lint(path: str, cf: ConfigParser) -> None:
    j_counter, m_counter = 0, 0
    for root, dirs, files in os_walk("build"):
        for filename in files:
            with open(file_path := root + os_sep + filename, "r+") as f:
                if (ext := filename.split(".")[-1]) == "json":
                    j_counter += 1
                    contents = parse_json_file(f)
                elif ext in ["mcfunction", "mcmeta"]:
                    m_counter += ext == "mcfunction"
                    contents = parse_mc_file(f)
                else:
                    continue

                if not contents:
                    print(f"   ### Empty file {file_path} ###")

                for kw in cf['DATA']:
                    contents = contents.replace(f"#{kw}", cf['DATA'][kw])

                f.seek(0)
                f.write(contents)
                f.truncate()
    print(f" - Linted {j_counter} JSON, {m_counter} MCFunction...")
