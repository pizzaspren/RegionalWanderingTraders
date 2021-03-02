execute as @e[type=wandering_trader,tag=!rwtlib.modified] run function rwtlib:set_region
schedule function rwtlib:update_trader 5t