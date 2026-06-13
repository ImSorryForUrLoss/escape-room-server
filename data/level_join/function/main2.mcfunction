# start forceloading and run main2.1
$tellraw @a[tag=logs] [{"color":"white","text":"running function "},{"color":"green","text":"level_join:main2"},{"color":"white","text":" with {"},{"color":"aqua","text":"room_num"},": ",{"color":"gold","text":"$(room_num)"},{"color":"white","text":", "},{"color":"aqua","text":"room_id"},": ",{"color":"gold","text":"$(room_id)"},{"color":"white","text":", "},{"color":"aqua","text":"room_coords"},": ",{"color":"gold","text":"$(room_coords)"},{"color":"white","text":"}"}]

$execute positioned $(room_coords) 0 0 run forceload add ~-16 ~-16 ~64 ~64
function level_join:main2.1 with storage minecraft:data lvlJoin
# do dumb /schedule foolery
# $setblock $(room_num) 1 130 minecraft:redstone_block
# $data modify block $(room_num) 1 131 Command set value "function level_join:main2.1 {room_num:$(room_num),room_id:$(room_id),room_coords:$(room_coords)}"