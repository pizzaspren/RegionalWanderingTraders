execute store result score @s rwt.r run data get entity @s UUID[1] 1
scoreboard players operation @s rwt.r %= rwt:max_regions rwt.r
execute if score @s rwt.r matches 0 run function rwt:region/arctic
execute if score @s rwt.r matches 1 run function rwt:region/beekeeper
execute if score @s rwt.r matches 2 run function rwt:region/cave
execute if score @s rwt.r matches 3 run function rwt:region/desert
execute if score @s rwt.r matches 4 run function rwt:region/end
execute if score @s rwt.r matches 5 run function rwt:region/forest
execute if score @s rwt.r matches 6 run function rwt:region/hunter
execute if score @s rwt.r matches 7 run function rwt:region/ocean
execute if score @s rwt.r matches 8 run function rwt:region/nether
tag @s add rwt.modified