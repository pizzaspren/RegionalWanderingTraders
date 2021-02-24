scoreboard players add $rwtlib:max_regions rwtlib.config 1
# Dont override past scores
execute unless score $rwt:config_done rwtlib.config matches 1 run scoreboard players set $rwt:hunter_enabled rwtlib.config 1

#debug
tellraw @a ["",{"text":"Hunter Trader -> "}, {"score":{"name":"$rwt:hunter_enabled","objective":"rwtlib.config"}}]