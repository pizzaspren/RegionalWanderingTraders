#debug
tellraw @a "Setting trades for End"
#debug off

data merge entity @s {CustomName:'{"text":"End Wanderer","color":"light_purple"}'}

loot insert 48000 0 0 loot rwt:end/0
loot insert 48000 0 0 loot rwt:end/1
loot insert 48000 0 0 loot rwt:end/2
loot insert 48000 0 0 loot rwt:end/3
loot insert 48000 0 0 loot rwt:end/4
loot insert 48000 0 0 loot rwt:end/5