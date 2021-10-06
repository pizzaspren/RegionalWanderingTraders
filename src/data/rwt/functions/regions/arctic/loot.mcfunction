#debug
tellraw @a "Setting trades for Arctic"
#debug off

data merge entity @s {CustomName:'{"color":"white","translate":"%1$s", "with": ["Arctic Wanderer", {"translate": "rwt.arctic_wanderer"}]}'}

loot insert 48000 0 0 loot rwt:arctic/0
loot insert 48000 0 0 loot rwt:arctic/1
loot insert 48000 0 0 loot rwt:arctic/2
loot insert 48000 0 0 loot rwt:arctic/3
loot insert 48000 0 0 loot rwt:arctic/4
loot insert 48000 0 0 loot rwt:arctic/5