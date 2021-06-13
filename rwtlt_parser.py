import json
import pathlib
from typing import IO

# Id, Count, Nbt
I, C, T = range(3)


def parse_table_entry(text: str) -> dict:

    def createBuyNbt(buy_entry):
        stringified = f"id:\"{buy_entry[I]}\",Count:{buy_entry[C]}b"
        if len(buy_entry) > 2 and (tag := buy_entry[T]):
            stringified += ",tag:{" + tag + "}"
        return "{" + stringified + "}"

    fields = [field.strip() for field in text.split("|")]
    sell, buy, buyB = fields[2:5], fields[5:8], fields[8:11]
    entry = {
        "type": "minecraft:item",
        "name": sell[I]
    }
    if sell[I][0] == "#":
        entry["type"] = "minecraft:tag"
        entry["name"] = sell[I][1:]
        entry["expand"] = True
    elif sell[I][0] == "!":
        entry["type"] = "minecraft:loot_table"
        entry["name"] = sell[I][1:]

    if fields[1]:
        entry["weight"] = int(fields[1])

    rwt = ",".join(filter(None, [
        f"maxUses:{fields[0]}" if fields[0] else "",
        f"buy:{createBuyNbt(buy)}" if any(buy) else "",
        f"buyB:{createBuyNbt(buyB)}" if any(buyB) else ""
    ]))

    nbt = ",".join(filter(None, [
        sell[T] if len(sell) > 2 else "",
        "rwt:{" + rwt + "}" if rwt else "",
    ]))

    functions = []
    if nbt:
        functions.append(
            {"function": "minecraft:set_nbt", "tag": "{" + nbt + "}"})
    if sell[C] and (count := int(sell[C])) > 1:
        functions.append({"function": "minecraft:set_count", "count": count})
    if fields[11]:
        functions.append(json.loads(fields[11]))
    if functions:
        entry["functions"] = functions

    return entry


def parse_function(text: str) -> dict:
    return json.loads(text[1:])


def read_table_from_file(p: IO[str]) -> str:
    lines = [line.strip() for line in p.readlines()[1::]]
    entries = []
    pool_functions = []
    for i in range(len(lines)):
        line = lines[i]
        if line == "#pool_functions":
            break
        entries.append(parse_table_entry(line))
    for j in range(i+1, len(lines)):
        line = lines[j]
        pool_functions.append(parse_function(line))

    loot_table = {
        "pools": [
            {
                    "rolls": 1,
                    "entries": entries
            }
        ]
    }
    if pool_functions:
        loot_table["pools"][0]["functions"] = pool_functions

    return json.dumps(loot_table, separators=(',', ':'))


if __name__ == "__main__":
    path = pathlib.Path('parser0.rwtlt')
    table = read_table_from_file(path)
    path.with_suffix(".json").write_text(table)
