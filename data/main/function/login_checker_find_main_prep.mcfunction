#> prep for login_checker_find_main
tellraw @a[tag=logs] [{"color":"white","text":"running function "},{"color":"green","text":"main:login_checker_find_main_prep"},{"color":"white","text":" with {}"}]

tp @e[type=marker] 0 0 0
scoreboard players operation temp_players misc = pCount loginChecker
scoreboard players remove temp_players misc 1
execute store result storage minecraft:data loginCheckerFindMain.marker short 1 run scoreboard players get temp_players misc
function main:login_checker_find_main with storage minecraft:data loginCheckerFindMain