#debug
execute if score $rwtlib.max_regions rwtlib.config matches 0 run tellraw @a "No regions configured, skipping trade assignment"
#debug off

execute unless score $rwtlib.max_regions rwtlib.config matches 0 as @e[type=wandering_trader,tag=!rwtlib.modified] run function rwtlib:set_region
schedule function rwtlib:update_trader 5t