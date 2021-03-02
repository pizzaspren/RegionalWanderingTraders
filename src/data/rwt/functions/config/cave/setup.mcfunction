# Dont override past scores
execute unless score $rwt:config_done rwtlib.config matches 1 run scoreboard players set $rwt:cave_enabled rwtlib.config 1
# Add region if enabled
scoreboard players operation $rwtlib:max_regions rwtlib.config += $rwt:cave_enabled rwtlib.config

#debug
tellraw @a ["",{"text":"Cave Trader -> "}, {"score":{"name":"$rwt:cave_enabled","objective":"rwtlib.config"}}]