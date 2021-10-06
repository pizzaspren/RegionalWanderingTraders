#debug
tellraw @a "Setting trades for Cave"
#debug off

data merge entity @s {CustomName:'{"color":"gray","translate":"%1$s", "with": ["Cave Wanderer", {"translate": "rwt.cave_wanderer"}]}'}

loot insert 48000 0 0 loot rwt:cave/0
loot insert 48000 0 0 loot rwt:cave/1
loot insert 48000 0 0 loot rwt:cave/2
loot insert 48000 0 0 loot rwt:cave/3
loot insert 48000 0 0 loot rwt:cave/4
loot insert 48000 0 0 loot rwt:cave/5