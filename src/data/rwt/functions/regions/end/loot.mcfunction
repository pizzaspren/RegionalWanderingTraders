#debug
tellraw @a "Setting trades for End"
#debug off

data merge entity @s {CustomName:'{"color":"light_purple","translate":"%1$s", "with": ["End Wanderer", {"translate": "rwt.end_wanderer"}]}'}

loot insert 48000 0 0 loot rwt:end/0
loot insert 48000 0 0 loot rwt:end/1
loot insert 48000 0 0 loot rwt:end/2
loot insert 48000 0 0 loot rwt:end/3
loot insert 48000 0 0 loot rwt:end/4
loot insert 48000 0 0 loot rwt:end/5