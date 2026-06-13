# update room_data and run level_join_tweaks:level_join_prep
$tellraw @a[tag=logs] [{"color":"white","text":"running function "},{"color":"green","text":"level_join_tweaks:route_player2"},{"color":"white","text":" with {"},{"color":"aqua","text":"roomNum"},": ",{"color":"gold","text":"$(roomNum)"},{"color":"white","text":"}"}]

# remove entry for room now that we are leaving it
$data remove storage minecraft:room_data room_$(roomNum).room_dir[0]
# if there is no room_dir[0], send them to the lobby
$execute unless data storage minecraft:room_data room_$(roomNum).room_dir[0] run return run function main:join_hub
# handle speedrun timer data
$data modify storage minecraft:data speedrunTimer.data.i set value $(roomNum)

# prep for running level_join_tweaks:level_join_prep
$data modify storage minecraft:data route_player.room_id set from storage minecraft:room_data room_$(roomNum).room_dir[0]
$data modify storage minecraft:data route_player.room_num set value $(roomNum)
execute store result storage minecraft:data route_player.room_coords int 512 run data get storage minecraft:data route_player.room_num 1

# remove entry for room we are joining as it will be re-added by the next func (this is a terrible solution)
$data remove storage minecraft:room_data room_$(roomNum).room_dir[0]

execute at @s run function level_join_tweaks:level_join_prep with storage minecraft:data route_player