execute as @e[type=wandering_trader,tag=!rwt.modified] run function rwt:set_region
schedule function rwt:update_trader 5t