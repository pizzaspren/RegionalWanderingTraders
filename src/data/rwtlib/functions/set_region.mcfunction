execute store result score @s rwtlib run data get entity @s UUID[1] 1
scoreboard players operation @s rwtlib %= rwtlib:max_regions rwtlib
function #rwtlib:regions
tag @s add rwtlib.modified