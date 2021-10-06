#debug
tellraw @a "Setting trades for Beekeeper"
#debug off

data merge entity @s {CustomName:'{"color":"yellow","translate":"%1$s", "with": ["Beekeeper Wanderer", {"translate": "rwt.beekeeper_wanderer"}]}'}

loot insert 48000 0 0 loot rwt:beekeeper/0
loot insert 48000 0 0 loot rwt:beekeeper/1
loot insert 48000 0 0 loot rwt:beekeeper/2
loot insert 48000 0 0 loot rwt:beekeeper/3
loot insert 48000 0 0 loot rwt:beekeeper/4
loot insert 48000 0 0 loot rwt:beekeeper/5