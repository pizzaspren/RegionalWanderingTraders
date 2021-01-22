data modify storage rwt:s T set from entity @s HandItems[0]
data modify entity @s Offers.Recipes[1] set from storage rwt:s T.tag.rwt
function rwt:copy/untag
data modify entity @s Offers.Recipes[1].sell set from storage rwt:s T