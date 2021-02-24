#debug
tellraw @a "RWT loaded"
#debug off

function #rwt:config/setup
scoreboard players set $rwt:config_done rwtlib.config 1

