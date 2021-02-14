execute store result score @s rwtlib.region run data get entity @s UUID[1] 1
scoreboard players operation @s rwtlib.region %= $rwtlib:max_regions rwtlib.config
function #rwtlib:regions
function rwtlib:set_trades
tag @s add rwtlib.modified