# illicit quantities of math
$tellraw @a[tag=logs] [{"color":"white","text":"running function "},{"color":"green","text":"level_tweaks:speedrun_timer"},{"color":"white","text":" with {"},{"color":"aqua","text":"i"},": ",{"color":"gold","text":"$(i)"},{"color":"white","text":"}"}]

# cur time = final ticks val
# level join time = level join time
# temp1 = seconds
# temp2 = floor ticks
# temp3 = final seconds val
# temp4 = final minutes val

# get cur time
# get level join time
# subtract level join time from cur time, setting cur time to the result
# copy result to temp1
# devide temp1 by 20 to get seconds
# copy result to temp2
# multiply temp2 by 20 to get ticks
# subtract temp2 from cur time to get remainder ticks
# copy temp1 to temp3
# devide temp3 by 60 to get minutes
# copy temp3 to temp4
# multiply temp3 by 60 to get seconds
# subtract temp3 from temp1 to get remainder seconds

# get time
execute store result score cur_time level_tweaks run data get block 0 8 128 LastExecution
$execute store result score lvl_time level_tweaks run data get block $(i) 2 130 LastExecution
scoreboard players operation cur_time level_tweaks -= lvl_time level_tweaks
scoreboard players operation temp1 level_tweaks = cur_time level_tweaks
scoreboard players operation temp1 level_tweaks /= 20 level_tweaks
scoreboard players operation temp2 level_tweaks = temp1 level_tweaks
scoreboard players operation temp2 level_tweaks *= 20 level_tweaks
scoreboard players operation cur_time level_tweaks -= temp2 level_tweaks
scoreboard players operation temp3 level_tweaks = temp1 level_tweaks
scoreboard players operation temp3 level_tweaks /= 60 level_tweaks
scoreboard players operation temp4 level_tweaks = temp3 level_tweaks
scoreboard players operation temp3 level_tweaks *= 60 level_tweaks
scoreboard players operation temp1 level_tweaks -= temp3 level_tweaks

# format output
scoreboard players operation cur_time level_tweaks *= 50 level_tweaks
data modify storage minecraft:data speedrunTimer.colon1 set value ":"
data modify storage minecraft:data speedrunTimer.colon2 set value "."

execute if score temp1 level_tweaks < 10 level_tweaks run data modify storage minecraft:data speedrunTimer.colon1 set value ":0"
execute if score cur_time level_tweaks matches 50 run data modify storage minecraft:data speedrunTimer.colon2 set value ".0"
execute if score cur_time level_tweaks matches 0 run data modify storage minecraft:data speedrunTimer.colon2 set value ".00"

# display output
title @s actionbar [{"text":"Final Time: "},{"score":{"name":"temp4","objective":"level_tweaks"}},{"storage":"data","source":"storage","nbt":"speedrunTimer.colon1"},{"score":{"name":"temp1","objective":"level_tweaks"}},{"storage":"data","source":"storage","nbt":"speedrunTimer.colon2"},{"score":{"name":"cur_time","objective":"level_tweaks"}}]