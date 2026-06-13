# find what room the new player is in
$tellraw @a[tag=logs] [{"color":"white","text":"running function "},{"color":"green","text":"main:login_checker_main"},{"color":"white","text":" with {"},{"color":"aqua","text":"i"},": ",{"color":"gold","text":"$(i)"},{"color":"white","text":"}"}]

# cutoff upon reaching 20
execute if score temp_timer_index misc matches 20 run return fail

# increment index
$scoreboard players set temp_timer_index misc $(i)
scoreboard players add temp_timer_index misc 1

# if player is in this room, run login_checker_end
$execute if entity @a[tag=new,tag=$(i)] run data modify storage minecraft:data loginCheckerEnd.room_num set value $(i)
$execute if entity @a[tag=new,tag=$(i)] run data modify storage minecraft:data loginCheckerEnd.room_id set from storage minecraft:data roomIds.$(i)
$execute if entity @a[tag=new,tag=$(i)] run function main:login_checker_end with storage minecraft:data loginCheckerEnd
# get new index val and rerun if fail
execute store result storage minecraft:data loginCheckerMain.i int 1 run scoreboard players get temp_timer_index misc
function main:login_checker_main with storage minecraft:data loginCheckerMain