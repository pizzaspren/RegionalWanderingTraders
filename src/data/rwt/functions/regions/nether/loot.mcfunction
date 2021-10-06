#debug
tellraw @a "Setting trades for Nether"
#debug off

data merge entity @s {CustomName:'{"color":"red","translate":"%1$s", "with": ["Nether Wanderer", {"translate": "rwt.nether_wanderer"}]}'}

loot insert 48000 0 0 loot rwt:nether/0
loot insert 48000 0 0 loot rwt:nether/1
loot insert 48000 0 0 loot rwt:nether/2
loot insert 48000 0 0 loot rwt:nether/3
loot insert 48000 0 0 loot rwt:nether/4
loot insert 48000 0 0 loot rwt:nether/5