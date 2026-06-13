# loop until chunks load, then run main3
$tellraw @a[tag=logs] [{"color":"white","text":"running function "},{"color":"green","text":"level_join:main2.1"},{"color":"white","text":" with {"},{"color":"aqua","text":"room_num"},": ",{"color":"gold","text":"$(room_num)"},{"color":"white","text":", "},{"color":"aqua","text":"room_id"},": ",{"color":"gold","text":"$(room_id)"},{"color":"white","text":", "},{"color":"aqua","text":"room_coords"},": ",{"color":"gold","text":"$(room_coords)"},{"color":"white","text":"}"}]

$execute positioned -128 65 0 as @n[tag=$(room_num), distance=0..3] if entity @n[type=minecraft:armor_stand,tag=$(room_num)] positioned $(room_coords).0 0.0 0.0 run return run function level_join:main3 {room_id:$(room_id), room_coords:$(room_coords), room_num:$(room_num)}
# return if chunks haven't loaded yet
$setblock $(room_num) 1 130 minecraft:redstone_block
$data modify block $(room_num) 1 131 Command set value "function level_join:main2.1 {room_num:$(room_num),room_id:$(room_id),room_coords:$(room_coords)}"
# set command to run main3
# $data modify block $(room_num) 1 131 Command set value "function level_join:main3 {room_num:$(room_num),room_id:$(room_id),room_coords:$(room_coords)}"