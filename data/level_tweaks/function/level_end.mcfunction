# handle level completion
tellraw @a[tag=logs] [{"color":"white","text":"running function "},{"color":"green","text":"level_tweaks:level_end"},{"color":"white","text":" with {}"}]

title @s title {"color":"green","text":"Level Complete!"}
execute at @s run function main:new_join
# storage data is created by lvl_complete, run by new_join, and is infact used
function level_tweaks:speedrun_timer with storage minecraft:data speedrunTimer.data