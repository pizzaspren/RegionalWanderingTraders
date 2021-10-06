#debug
tellraw @a "Setting trades for Forest"
#debug off

data merge entity @s {CustomName:'{"color":"dark_green","translate":"%1$s", "with": ["Forest Wanderer", {"translate": "rwt.forest_wanderer"}]}'}

loot insert 48000 0 0 loot rwt:forest/0
loot insert 48000 0 0 loot rwt:forest/1
loot insert 48000 0 0 loot rwt:forest/2
loot insert 48000 0 0 loot rwt:forest/3
loot insert 48000 0 0 loot rwt:forest/4
loot insert 48000 0 0 loot rwt:forest/5