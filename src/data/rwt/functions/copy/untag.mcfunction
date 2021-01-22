data remove storage rwt:s T.tag.rwt
execute store result score @s rwt.tc run data get storage rwt:s T.tag
execute if score @s rwt.tc matches 0 run data remove storage rwt:s T.tag