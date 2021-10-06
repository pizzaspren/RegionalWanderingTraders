#region Title
tellraw @s ["["]
#fold      ,{"text":"#name ","color":"aqua"}
#fold      ,{"text":"#version","color":"green"}
#fold      ,"]"
#endregion

#region Spreadsheet
tellraw @s ["    "]
#fold      ,{"color":"gold","translate":"%1$s", "with": ["Trade spreadsheet", {"translate": "rwt.spreadsheet"}],"clickEvent":{
#fold          "action":"open_url","value":"https://docs.google.com/spreadsheets/d/1F4TPfAUoG22kroq3zFg_pFcz0A5_S6eC6JmfG37_2aQ/edit?usp=sharing"}}
#endregion

#region Configuration
tellraw @s ["    "]
#fold      ,{"color":"gold","translate":"%1$s", "with": ["Configuration", {"translate": "rwt.configuration"}],"clickEvent":{
#fold          "action":"run_command","value":"/function rwt:config"}}
#endregion

#region Updates
tellraw @s ["    "]
#fold      ,{"color":"green","translate":"%1$s", "with": ["Check for updates?", {"translate": "rwt.updates"}],"clickEvent":{
#fold          "action":"open_url","value":"https://www.planetminecraft.com/data-pack/regional-wandering-traders-1-17/"}}
#endregion