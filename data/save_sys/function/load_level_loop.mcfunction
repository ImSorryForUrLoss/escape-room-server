$tellraw @a[tag=logs] [{"color":"white","text":"running function "},{"color":"green","text":"save_sys:load_level_loop"},{"color":"white","text":" with {"},{"color":"aqua","text":"room_id"},": ",{"color":"gold","text":"$(room_id)"},{"color":"white","text":", "},{"color":"aqua","text":"room_coords"},": ",{"color":"gold","text":"$(room_coords)"},{"color":"white","text":", "},{"color":"aqua","text":"save_num"},": ",{"color":"gold","text":"$(save_num)"},{"color":"white","text":"}"}]

$execute positioned -128 65 0 as @p[tag=$(room_id), distance=0..3] if entity @n[type=minecraft:armor_stand,tag=$(room_id)] positioned $(room_coords) 0 0 run return run function save_sys:load_level_main {room_id:$(room_id), room_coords:$(room_coords), save_num:$(save_num)}

# perform absurd looping foolery
$setblock $(room_id) 1 130 minecraft:redstone_block
$data modify block $(room_id) 1 131 Command set value "function save_sys:load_level_loop {room_id:$(room_id), room_coords:$(room_coords), save_num:$(save_num)}"