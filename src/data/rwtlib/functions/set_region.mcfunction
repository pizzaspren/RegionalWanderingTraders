execute store result score @s rwtlib.region run data get entity @s UUID[1] 1
scoreboard players operation @s rwtlib.region %= $rwtlib:max_regions rwtlib.config

#debug
tellraw @a [""]
#fold      ,"Trader Region ID -> "
#fold      ,{"score":{"name":"@s","objective":"rwtlib.region"}}
#fold      ,"/"
#fold      ,{"score":{"name":"$rwtlib:max_regions","objective":"rwtlib.config"}}
#debug off

function #rwtlib:regions
function rwtlib:set_trades
tag @s add rwtlib.modified