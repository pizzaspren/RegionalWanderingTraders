#region Title
tellraw @s ["["]
#fold      ,{"text":"#name ","color":"aqua"}
#fold      ,{"text":"#version","color":"green"}
#fold      ,"]"
#endregion

#region Spreadsheet
tellraw @s ["    "]
#fold      ,{"text":"Trade spreadsheet","color":"gold","clickEvent":{
#fold          "action":"open_url","value":"https://docs.google.com/spreadsheets/d/1F4TPfAUoG22kroq3zFg_pFcz0A5_S6eC6JmfG37_2aQ/edit?usp=sharing"}}
#endregion

#region Configuration
tellraw @s ["    "]
#fold      ,{"text":"Configuration","color":"gold","clickEvent":{
#fold          "action":"run_command","value":"/function rwt:config"}}
#endregion

#region Updates
tellraw @s ["    "]
#fold      ,{"text":"Check for updates?","color":"orange","clickEvent":{
#fold          "action":"open_url","value":"https://www.planetminecraft.com/data-pack/regional-wandering-traders-1-17/"}}
#endregion