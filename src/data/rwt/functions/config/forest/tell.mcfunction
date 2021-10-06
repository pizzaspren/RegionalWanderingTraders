execute if score $rwt:forest_enabled rwtlib.config matches 1 run tellraw @s [""]
#fold    ,{"text":"[\u2714] ","bold":true,"color":"green","clickEvent":{"action":"run_command","value":"/function rwt:config/forest/disable"}}
#fold    ,{"translate":"%1$s", "with": ["Forest Wanderer", {"translate": "rwt.forest_wanderer"}]}
execute if score $rwt:forest_enabled rwtlib.config matches 0 run tellraw @s [""]
#fold    ,{"text":"[\u2716] ","bold":true,"color":"red","clickEvent":{"action":"run_command","value":"/function rwt:config/forest/enable"}}
#fold    ,{"translate":"%1$s", "with": ["Forest Wanderer", {"translate": "rwt.forest_wanderer"}]}