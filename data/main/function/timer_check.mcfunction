# if a player has not logged on in the last 8 minutes, send them to the lobby

# increment index
$scoreboard players set temp_timer_index misc $(i)
scoreboard players add temp_timer_index misc 1

# reset timer if player is found
$execute if entity @a[tag=$(i)] run data modify block $(i) 1 131 LastExecution set from block 0 8 128 LastExecution
$execute store result score temp_exe_time misc run data get block $(i) 1 131 LastExecution 1
scoreboard players operation temp_exe_time misc -= temp_cur_time misc
$execute if score temp_exe_time misc < room_time_limit misc run function main:timer_end {i:$(i)}
$execute if score temp_exe_time misc < room_time_limit misc run data modify block $(i) 1 131 LastExecution set value 1000000000

# cutoff upon reaching 20
execute if score temp_timer_index misc matches 20 run return fail

# get new index val and rerun if fail
execute store result storage minecraft:data timerTemp.i int 1 run scoreboard players get temp_timer_index misc
function main:timer_check with storage minecraft:data timerTemp