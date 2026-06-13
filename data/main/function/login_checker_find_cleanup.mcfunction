# remove all tags
$tellraw @a[tag=logs] [{"color":"white","text":"running function "},{"color":"green","text":"main:login_checker_find_cleanup"},{"color":"white","text":" with {"},{"color":"aqua","text":"i"},": ",{"color":"gold","text":"$(i)"},{"color":"white","text":"}"}]

# cutoff upon reaching pcount
execute if score temp_index misc = pCount loginChecker run return fail

# increment index
$scoreboard players set temp_index misc $(i)
scoreboard players add temp_index misc 1

# for each tag, remove it
$tag @a remove p_$(i)

# get new index val and rerun if fail
execute store result storage minecraft:data loginCheckerFind.i int 1 run scoreboard players get temp_index misc
function main:login_checker_find_cleanup with storage minecraft:data loginCheckerFind