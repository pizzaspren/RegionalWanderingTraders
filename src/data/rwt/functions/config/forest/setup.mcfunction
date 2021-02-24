scoreboard players add $rwtlib:max_regions rwtlib.config 1
# Dont override past scores
execute unless score $rwt:config_done rwtlib.config matches 1 run scoreboard players set $rwt:forest_enabled rwtlib.config 1

#debug
tellraw @a ["",{"text":"Forest Trader -> "}, {"score":{"name":"$rwt:forest_enabled","objective":"rwtlib.config"}}]