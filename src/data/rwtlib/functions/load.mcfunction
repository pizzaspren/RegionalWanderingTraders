scoreboard objectives add rwtlib dummy
scoreboard players set rwtlib:max_regions rwtlib 0
scoreboard players set rwtlib:tag_count rwtlib 0

forceload add 48000 0
setblock 48000 0 0 minecraft:yellow_shulker_box

schedule function rwtlib:update_trader 5t