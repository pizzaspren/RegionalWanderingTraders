execute if score $rwt:nether_enabled rwtlib.config matches 1 run tellraw @s [""]
#fold    ,{"text":"[\u2714] ","bold":true,"color":"green","clickEvent":{"action":"run_command","value":"/function rwt:config/nether/disable"}}
#fold    ,{"translate":"%1$s", "with": ["Nether Wanderer", {"translate": "rwt.nether_wanderer"}]}
execute if score $rwt:nether_enabled rwtlib.config matches 0 run tellraw @s [""]
#fold    ,{"text":"[\u2716] ","bold":true,"color":"red","clickEvent":{"action":"run_command","value":"/function rwt:config/nether/enable"}}
#fold    ,{"translate":"%1$s", "with": ["Nether Wanderer", {"translate": "rwt.nether_wanderer"}]}