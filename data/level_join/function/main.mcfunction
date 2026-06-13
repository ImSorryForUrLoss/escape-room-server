# mark room as occupied, do prep player, and run main2_prep next tick
$tellraw @a[tag=logs] [{"color":"white","text":"running function "},{"color":"green","text":"level_join:main"},{"color":"white","text":" with {"},{"color":"aqua","text":"room_num"},": ",{"color":"gold","text":"$(room_num)"},{"color":"white","text":", "},{"color":"aqua","text":"room_id"},": ",{"color":"gold","text":"$(room_id)"},{"color":"white","text":"}"}]

# marks room as occupied
$data remove storage minecraft:data roomSpaces.$(room_num)
# store player id for later reference
$data modify storage minecraft:data roomIds.$(room_num) set from entity @p UUID
# handle player
# execute as @s unless entity @s[tag=inLobby] run function main:lvl_complete {i:1}
$tag @s add $(room_num)
tag @s remove dark
tag @s remove inLobby
tp @s -128 -64 0
spawnpoint @s -128 65 0
gamemode survival @s
kill @s

# update room data
$data modify storage room_data room_$(room_num).cur_room set value "$(room_id)"
$data modify storage room_data room_$(room_num).room_dir prepend value "$(room_id)"
# calculate room coords
$data modify storage minecraft:data lvlJoin.room_coords set value $(room_num)
execute store result storage minecraft:data lvlJoin.room_coords int 512 run data get storage minecraft:data lvlJoin.room_coords
# run main2 with params
$data modify storage minecraft:data lvlJoin.room_num set value $(room_num)
$data modify storage minecraft:data lvlJoin.room_id set value $(room_id)
function level_join:main2 with storage minecraft:data lvlJoin




# do dumb /schedule foolery
# $setblock $(roomNum) 1 130 minecraft:redstone_block
# $data modify block $(roomNum) 1 131 Command set value "function level_join:main2_prep {roomNum:$(roomNum),roomId:$(roomId)}"