#debug
tellraw @a "Setting trades for Hunter"
#debug off

data merge entity @s {CustomName:'{"color":"red","translate":"%1$s", "with": ["Hunter Wanderer", {"translate": "rwt.hunter_wanderer"}]}'}

loot insert 48000 0 0 loot rwt:hunter/0
loot insert 48000 0 0 loot rwt:hunter/1
loot insert 48000 0 0 loot rwt:hunter/2
loot insert 48000 0 0 loot rwt:hunter/3
loot insert 48000 0 0 loot rwt:hunter/4
loot insert 48000 0 0 loot rwt:hunter/5