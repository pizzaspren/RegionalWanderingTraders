data modify storage rwtlib T set from entity @s HandItems[0]
data modify entity @s Offers.Recipes[0] set from storage rwtlib T.tag.rwt
function rwtlib:set_trade/untag
data modify entity @s Offers.Recipes[0].sell set from storage rwtlib T