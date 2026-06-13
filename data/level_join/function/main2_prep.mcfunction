# calc room coords, handle room data, and run main2
$tellraw @a[tag=logs] [{"color":"white","text":"running function "},{"color":"green","text":"level_join:main2_prep"},{"color":"white","text":" with {"},{"color":"aqua","text":"roomNum"},": ",{"color":"gold","text":"$(roomNum)"},{"color":"white","text":", "},{"color":"aqua","text":"roomId"},": ",{"color":"gold","text":"$(roomId)"},{"color":"white","text":"}"}]

# prep for room detection
# calculate room coords
scoreboard players set temp_room_space misc 512
$scoreboard players set temp_mult misc $(roomNum)
scoreboard players operation temp_room_space misc *= temp_mult misc
execute store result storage minecraft:data lvlJoin.roomCoords int 1 run scoreboard players get temp_room_space misc
# update room data
$data modify storage room_data room_$(roomNum).cur_room set value "$(roomId)"
$data modify storage room_data room_$(roomNum).room_dir prepend value "$(roomId)"
# run main2 with params
$data modify storage minecraft:data lvlJoin.roomNum set value $(roomNum)
$data modify storage minecraft:data lvlJoin.roomId set value $(roomId)
function level_join:main2 with storage minecraft:data lvlJoin