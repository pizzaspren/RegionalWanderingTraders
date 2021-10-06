#debug
tellraw @a "Setting trades for Desert"
#debug off

data merge entity @s {CustomName:'{"color":"gold","translate":"%1$s", "with": ["Desert Wanderer", {"translate": "rwt.desert_wanderer"}]}'}

loot insert 48000 0 0 loot rwt:desert/0
loot insert 48000 0 0 loot rwt:desert/1
loot insert 48000 0 0 loot rwt:desert/2
loot insert 48000 0 0 loot rwt:desert/3
loot insert 48000 0 0 loot rwt:desert/4
loot insert 48000 0 0 loot rwt:desert/5