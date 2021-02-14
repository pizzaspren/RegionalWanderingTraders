scoreboard objectives add rwtlib.region dummy

scoreboard objectives add rwtlib.config dummy
scoreboard players set $rwtlib:max_regions rwtlib.config 0
scoreboard players set $rwtlib:tag_count rwtlib.config 0

forceload add 48000 0
setblock 48000 0 0 minecraft:yellow_shulker_box

schedule function rwtlib:update_trader 5t