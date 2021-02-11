# Remove previous offers
data modify storage rwtlib:storage Recipes set value []

# Copy buy items and maxUses (item order is preserved)
data modify storage rwtlib:storage Recipes append from storage rwtlib:storage Items[].tag.rwt

# Remove "rwt" tag from all items
data remove storage rwtlib:storage Items[].tag.rwt

# Remove empty "tag" from item 0
execute store result score rwtlib:tag_count rwtlib run data get storage rwtlib:storage Items[0].tag
execute if score rwtlib:tag_count rwtlib matches 0 run data remove storage rwtlib:storage Items[0].tag
# Remove empty "tag" from item 1
execute store result score rwtlib:tag_count rwtlib run data get storage rwtlib:storage Items[1].tag
execute if score rwtlib:tag_count rwtlib matches 0 run data remove storage rwtlib:storage Items[1].tag
# Remove empty "tag" from item 2
execute store result score rwtlib:tag_count rwtlib run data get storage rwtlib:storage Items[2].tag
execute if score rwtlib:tag_count rwtlib matches 0 run data remove storage rwtlib:storage Items[2].tag
# Remove empty "tag" from item 3
execute store result score rwtlib:tag_count rwtlib run data get storage rwtlib:storage Items[3].tag
execute if score rwtlib:tag_count rwtlib matches 0 run data remove storage rwtlib:storage Items[3].tag
# Remove empty "tag" from item 4
execute store result score rwtlib:tag_count rwtlib run data get storage rwtlib:storage Items[4].tag
execute if score rwtlib:tag_count rwtlib matches 0 run data remove storage rwtlib:storage Items[4].tag
# Remove empty "tag" from item 5
execute store result score rwtlib:tag_count rwtlib run data get storage rwtlib:storage Items[5].tag
execute if score rwtlib:tag_count rwtlib matches 0 run data remove storage rwtlib:storage Items[5].tag

# Copy sell items to correct path
data modify storage rwtlib:storage Recipes[0].sell set from storage rwtlib:storage Items[0]
data modify storage rwtlib:storage Recipes[1].sell set from storage rwtlib:storage Items[1]
data modify storage rwtlib:storage Recipes[2].sell set from storage rwtlib:storage Items[2]
data modify storage rwtlib:storage Recipes[3].sell set from storage rwtlib:storage Items[3]
data modify storage rwtlib:storage Recipes[4].sell set from storage rwtlib:storage Items[4]
data modify storage rwtlib:storage Recipes[5].sell set from storage rwtlib:storage Items[5]

# Storage cleanup not needed because it's overwritten each time