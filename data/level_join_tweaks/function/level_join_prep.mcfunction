# load a new level in the current room and send the player into it
$tellraw @a[tag=logs] [{"color":"white","text":"running function "},{"color":"green","text":"level_join_tweaks:level_join_prep"},{"color":"white","text":" with {"},{"color":"aqua","text":"room_num"},": ",{"color":"gold","text":"$(room_num)"},{"color":"white","text":", "},{"color":"aqua","text":"room_id"},": ",{"color":"gold","text":"$(room_id)"},{"color":"white","text":", "},{"color":"aqua","text":"room_coords"},": ",{"color":"gold","text":"$(room_coords)"},{"color":"white","text":"}"}]

# handle player
tag @s remove dark
tp @s -128 -64 0
spawnpoint @s -128 65 0
kill @s
# update room data
$data modify storage room_data room_$(room_num).cur_room set value "$(room_id)"
$data modify storage room_data room_$(room_num).room_dir prepend value "$(room_id)"
# forceload
$execute positioned $(room_coords) 0 0 run forceload add ~-16 ~-16 ~64 ~64

# perform absurd looping foolery, this should not be needed, as if a player is dead they should no longer be alive, but i guess it doesnt work that way
# $setblock $(room_num) 1 130 minecraft:redstone_block
# $data modify block $(room_num) 1 131 Command set value "function level_join_tweaks:level_join_prep {room_id:$(room_id), room_coords:$(room_coords), room_num:$(room_num)}"

$function level_join_tweaks:level_join_loop {room_num:$(room_num), room_id:$(room_id), room_coords:$(room_coords)}