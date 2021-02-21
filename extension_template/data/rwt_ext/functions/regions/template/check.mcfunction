## This template only adds one region, and it has no configuration options.
## Configuration is responsibility of the datapack creator for the time being.

## Score rwtlib.region is being decremented for each trade that has been checked.
## This prevents values from being hardcoded and simplifies datapack extension. 


# If rwtlib.region score equals 0, the region to be assigned is this one.
# Run the function to spawn the loot in the shulkerbox
execute if score @s rwtlib.region matches 0 run function rwt_ext:regions/template/loot

# Always decrease score by 1, even if this is not the correct trade.
scoreboard players remove @s rwtlib.region 1