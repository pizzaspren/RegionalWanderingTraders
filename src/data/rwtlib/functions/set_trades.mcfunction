### ShulkerBox -> Storage ###
# We can ignore "Slot" NBT because WT does not support it
data modify storage rwtlib:storage Items set from block 48000 0 0 Items
data remove block 48000 0 0 Items

### Storage manipulation ###
execute if data storage rwtlib:storage Items run function rwtlib:storage_manip

### Storage -> WT ###
execute if data storage rwtlib:storage Recipes run data modify entity @s Offers.Recipes set from storage rwtlib:storage Recipes
