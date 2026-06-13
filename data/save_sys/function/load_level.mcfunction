# main2: forceload and run main2.1 next tick
$tellraw @a[tag=logs] [{"color":"white","text":"running function "},{"color":"green","text":"save_sys:load_level"},{"color":"white","text":" with {"},{"color":"aqua","text":"room_id"},": ",{"color":"gold","text":"$(room_id)"},{"color":"white","text":", "},{"color":"aqua","text":"room_coords"},": ",{"color":"gold","text":"$(room_coords)"},{"color":"white","text":"}"}]

# reset player, load chunks, run main3 after chunks load
$execute positioned $(room_coords) 0 0 run forceload add ~-16 ~-16 ~64 ~64

# handle player
tp @s -128 -64 0
spawnpoint @s -128 65 0
gamemode survival @s
kill @s

$function save_sys:load_level_loop {room_id:$(room_id), room_coords:$(room_coords), save_num:$(save_num)}
# $setblock $(room_coords) 2 -48 minecraft:structure_block[mode=save]{mode:"SAVE",name:"minecraft:save$(save_num)_r$(room_id)",posX:0,posY:-2,posZ:48,powered:0b,sizeX:48,sizeY:48,sizeZ:48}
# $setblock $(room_coords) 0 -48 minecraft:command_block{Command:"function save_sys:save_level_save {room_coords:$(room_coords)}",powered:0b}
# $setblock $(room_coords) 1 -48 minecraft:redstone_block