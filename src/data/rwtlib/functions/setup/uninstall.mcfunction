#debug
tellraw @a "Uninstalling RWTLib"
#debug off

scoreboard objectives remove rwtlib.region
scoreboard objectives remove rwtlib.config

setblock 48000 0 0 minecraft:air
forceload remove 48000 0
schedule clear rwtlib:update_trader