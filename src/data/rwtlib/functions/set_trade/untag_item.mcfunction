data remove storage rwtlib T.tag.rwt
execute store result score rwtlib:tag_count rwtlib run data get storage rwtlib T.tag
execute if score rwtlib:tag_count rwtlib matches 0 run data remove storage rwtlib T.tag