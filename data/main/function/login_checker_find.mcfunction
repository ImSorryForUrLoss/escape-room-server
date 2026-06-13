# give all players and markers a unique tag
$tellraw @a[tag=logs] [{"color":"white","text":"running function "},{"color":"green","text":"main:login_checker_find"},{"color":"white","text":" with {"},{"color":"aqua","text":"i"},": ",{"color":"gold","text":"$(i)"},{"color":"white","text":"}"}]

# cutoff upon reaching pcount
execute if score temp_timer_index misc = pCount loginChecker run return run function main:login_checker_find_main_prep

# increment index
$scoreboard players set temp_timer_index misc $(i)
scoreboard players add temp_timer_index misc 1

# for each player, give them and their marker a unique tag
$tag @a[sort=nearest,limit=$(i)] add temp_ignore
$tag @p[tag=!temp_ignore] add p_$(i)
$execute at @a[tag=p_$(i)] run tag @n[type=marker] add p_$(i)
tag @a remove temp_ignore

# get new index val and rerun if fail
execute store result storage minecraft:data loginCheckerFind.i int 1 run scoreboard players get temp_timer_index misc
function main:login_checker_find with storage minecraft:data loginCheckerFind