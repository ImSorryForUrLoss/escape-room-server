# load the chunks needed for the rest of this util
# needs i, max, roomCoords

# cutoff upon reaching max
$scoreboard players set max server_util $(max)
execute if score temp_timer_index misc > max server_util run return fail

# increment index
$scoreboard players set temp_timer_index misc $(i)
scoreboard players add temp_timer_index misc 1

# make stand for this room
$execute positioned $(roomCoords) 0 0 run forceload add ~ ~
$say Loading chunk at $(roomCoords)

# load some other chunks that are needed later
$execute positioned $(roomCoords) 0 0 run forceload add ~ ~-48

# generate roomCoords for next room
scoreboard players set temp_room_coords server_util 512
scoreboard players operation temp_room_coords server_util *= temp_timer_index misc
execute store result storage minecraft:data respawnArmorstands.roomCoords int 1 run scoreboard players get temp_room_coords server_util
$data modify storage minecraft:data respawnArmorstands.max set value $(max)

# get new index val and rerun if fail
execute store result storage minecraft:data respawnArmorstands.i int 1 run scoreboard players get temp_timer_index misc
function server_util:reset_armorstands_chunkload with storage minecraft:data respawnArmorstands