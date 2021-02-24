#debug
tellraw @a "Setting trades for Nether"
#debug off

data merge entity @s {CustomName:'{"text":"Nether Wanderer","color":"red"}'}

loot insert 48000 0 0 loot rwt:nether/0
loot insert 48000 0 0 loot rwt:nether/1
loot insert 48000 0 0 loot rwt:nether/2
loot insert 48000 0 0 loot rwt:nether/3
loot insert 48000 0 0 loot rwt:nether/4
loot insert 48000 0 0 loot rwt:nether/5