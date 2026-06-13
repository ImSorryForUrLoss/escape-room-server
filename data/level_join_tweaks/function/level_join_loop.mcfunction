# loop until the player respawns and the chunks load
$tellraw @a[tag=logs] [{"color":"white","text":"running function "},{"color":"green","text":"level_join_tweaks:level_join_loop"},{"color":"white","text":" with {"},{"color":"aqua","text":"room_id"},": ",{"color":"gold","text":"$(room_id)"},{"color":"white","text":", "},{"color":"aqua","text":"room_coords"},": ",{"color":"gold","text":"$(room_coords)"},{"color":"white","text":", "},{"color":"aqua","text":"room_num"},": ",{"color":"gold","text":"$(room_num)"},{"color":"white","text":"}"}]

$execute positioned -128 65 0 as @p[tag=$(room_num), distance=0..3] if entity @n[type=minecraft:armor_stand,tag=$(room_num)] positioned $(room_coords).0 0.0 0.0 run return run function level_join_tweaks:level_join_main {room_id:$(room_id), room_coords:$(room_coords), room_num:$(room_num)}

# perform absurd looping foolery
$setblock $(room_num) 1 130 minecraft:redstone_block
$data modify block $(room_num) 1 131 Command set value "function level_join_tweaks:level_join_loop {room_id:$(room_id), room_coords:$(room_coords), room_num:$(room_num)}"