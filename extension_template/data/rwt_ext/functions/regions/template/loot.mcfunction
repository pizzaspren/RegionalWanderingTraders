## This template only adds one region, and it has no configuration options.
## Configuration is responsibility of the datapack creator for the time being.

## This function should only be called when assigning a trade.
## Due to system limitations, each loot table should spawn only the item to be sold.
## Because rwtlib overwrites the 6 trades of a Wandering Trader, it is highly recommended
## that 6 items are created. It is possible to generate fewer items, but any excess
## items will not be properly parsed (subject to change in future versions).

## The Wandering Trader (as of 21w07a) has the following NBT structure for the trades:
##
## Offers: {
##   Recipes: [                                  | List of trade options
##     {
##       buy: {id, Count, tag},                  | The first 'cost' item.
##       buyB: {id, Count, tag},                 | The second 'cost' item. Optional.
##       maxUses,                                | The maximum number of times this trade can be used before it is disabled.
##       rewardXp,                               | 1 or 0 (true/false) - true if this trade provides XP orb drops.
##       uses,                                   | The number of times this trade has been used.
##       sell: {id, Count, tag}                  | The item being sold for each set of cost items. 
##     }
##   ]
## }
##
## Because it would not be possible to know which looted item goes into which NBT path
## (buy, buyB, sell), rwtlib assumes that the item that is looted goes into the 'sell'
## NBT.
## The rest of NBT tags are expected to exist inside an item tag called "rwt" in the
## following fashion:
##
## {
##   id: "minecraft:stone",                      | ID of the item to sell
##   Count: 1,                                   | Amount to sell
##   tag: {
##     <Any item tags>,                          | Enchantments, Potion effects, Map NBT, custom item NBT, whatever you want.
##     rwt: {                                    | >>> Custom compound that will be extracted.
##       buy: {id, Count, tag},                  | Mandatory - The first 'cost' item.
##       buyB: {id, Count, tag},                 | Optional - The second 'cost' item.
##       maxUses,                                | Mandatory - The maximum number of times this trade can be used before it is disabled.
##       rewardXp,                               | Optional - 1 or 0 (true/false) - true if this trade provides XP orb drops.
##       uses                                    | Optional - The item being sold for each set of cost items.
##     }
##   }
## }

# (Optional) Set custom name 
data merge entity @s {CustomName:'{"text":"RWT Extension Template","color":"black"}'}


## These are example trades to showcase how to set up different trades.
## You can edit the loot tables to drop anything.

# Loot trade items into the ShulkerBox at x48000, y0, z0
## 1 emerald for 1 stone - 12 maxUses
loot insert 48000 0 0 loot rwt_ext:template/0

## 1 stone for 1 emerald - 12 maxUses
loot insert 48000 0 0 loot rwt_ext:template/1

## 1 emerald and 1 diamond for 1 stone - 12 maxUses
loot insert 48000 0 0 loot rwt_ext:template/2

## 5 emeralds for 20 stones called "An example name" - 1 maxUses
loot insert 48000 0 0 loot rwt_ext:template/3

## "rwt" NBT can also be set with multiple loot table functions. This might be simpler for the uninitiated
## 2 paper for 1 Splash Potion of Night Vision - 3 maxUses
loot insert 48000 0 0 loot rwt_ext:template/4

## 10% -> 1 emerald for 1 stone - 1 maxUses
## 90% -> 1 Diamond pickaxe enchanted with Silk Touch for 1 Wooden Axe enchanted at level 30 - 64 maxUses
loot insert 48000 0 0 loot rwt_ext:template/5
