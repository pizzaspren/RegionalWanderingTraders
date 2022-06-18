#debug
tellraw @a "Setting trades for Swamp"
#debug off

data merge entity @s {CustomName:'{"color":"dark_purple","translate":"%1$s", "with": ["Swamp Wanderer", {"translate": "rwt.swamp_wanderer"}]}'}

loot insert 48000 0 0 loot rwt:swamp/0
loot insert 48000 0 0 loot rwt:swamp/1
loot insert 48000 0 0 loot rwt:swamp/2
loot insert 48000 0 0 loot rwt:swamp/3
loot insert 48000 0 0 loot rwt:swamp/4
loot insert 48000 0 0 loot rwt:swamp/5