scoreboard players add $rwtlib:max_regions rwtlib.config 1
# Dont override past scores
execute unless score $rwt:config_done rwtlib.config matches 1 run scoreboard players set $rwt:ocean_enabled rwtlib.config 1

#debug
tellraw @a ["",{"text":"Ocean Trader -> "}, {"score":{"name":"$rwt:ocean_enabled","objective":"rwtlib.config"}}]