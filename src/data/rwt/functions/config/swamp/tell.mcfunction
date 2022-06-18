execute if score $rwt:swamp_enabled rwtlib.config matches 1 run tellraw @s [""]
#fold    ,{"text":"[\u2714] ","bold":true,"color":"green","clickEvent":{"action":"run_command","value":"/function rwt:config/swamp/disable"}}
#fold    ,{"translate":"%1$s", "with": ["Swamp Wanderer", {"translate": "rwt.swamp_wanderer"}]}
execute if score $rwt:swamp_enabled rwtlib.config matches 0 run tellraw @s [""]
#fold    ,{"text":"[\u2716] ","bold":true,"color":"red","clickEvent":{"action":"run_command","value":"/function rwt:config/swamp/enable"}}
#fold    ,{"translate":"%1$s", "with": ["Swamp Wanderer", {"translate": "rwt.swamp_wanderer"}]}