execute if score $rwt:beekeeper_enabled rwtlib.config matches 1 run tellraw @s [""]
#fold    ,{"text":"[\u2714] ","bold":true,"color":"green","clickEvent":{"action":"run_command","value":"/function rwt:config/beekeeper/disable"}}
#fold    ,{"translate":"%1$s", "with": ["Beekeeper Wanderer", {"translate": "rwt.beekeeper_wanderer"}]}
execute if score $rwt:beekeeper_enabled rwtlib.config matches 0 run tellraw @s [""]
#fold    ,{"text":"[\u2716] ","bold":true,"color":"red","clickEvent":{"action":"run_command","value":"/function rwt:config/beekeeper/enable"}}
#fold    ,{"translate":"%1$s", "with": ["Beekeeper Wanderer", {"translate": "rwt.beekeeper_wanderer"}]}