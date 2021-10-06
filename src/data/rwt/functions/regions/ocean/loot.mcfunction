#debug
tellraw @a "Setting trades for Ocean"
#debug off

data merge entity @s {CustomName:'{"color":"aqua","translate":"%1$s", "with": ["Ocean Wanderer", {"translate": "rwt.ocean_wanderer"}]}'}

loot insert 48000 0 0 loot rwt:ocean/0
loot insert 48000 0 0 loot rwt:ocean/1
loot insert 48000 0 0 loot rwt:ocean/2
loot insert 48000 0 0 loot rwt:ocean/3
loot insert 48000 0 0 loot rwt:ocean/4
loot insert 48000 0 0 loot rwt:ocean/5