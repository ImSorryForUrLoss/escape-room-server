# save stuff idc
$tellraw @a[tag=logs] [{"color":"white","text":"running function "},{"color":"green","text":"save_sys:save_level"},{"color":"white","text":" with {"},{"color":"aqua","text":"room_id"},": ",{"color":"gold","text":"$(room_id)"},{"color":"white","text":", "},{"color":"aqua","text":"room_coords"},": ",{"color":"gold","text":"$(room_coords)"},{"color":"white","text":", "},{"color":"aqua","text":"save_num"},": ",{"color":"gold","text":"$(save_num)"},{"color":"white","text":"}"}]

# gen storage crate
$execute positioned $(room_coords) 0 0 run fill ~45 ~2 ~45 ~47 ~0 ~47 minecraft:bedrock
$execute positioned $(room_coords) 0 0 run setblock ~47 ~0 ~47 minecraft:barrel{CustomName:"\"PART OF SAVE SYS: DO NOT ABUSE\""}
$execute positioned $(room_coords) 0 0 run setblock ~46 ~0 ~47 minecraft:barrel{CustomName:"\"PART OF SAVE SYS: DO NOT ABUSE\""}

# fill crate
execute as @s run function save_sys:save_items
$execute positioned $(room_coords) 0 0 run data modify block ~47 ~0 ~47 Items set from block 1 8 128 Items
$execute positioned $(room_coords) 0 0 run data modify block ~46 ~0 ~47 Items set from block 2 8 128 Items

# save player pos
execute at @s run summon minecraft:marker ~ ~ ~ {Tags:["player_pos"]}
data modify entity @n[type=minecraft:marker] Rotation set from entity @s Rotation

$setblock $(room_coords) 2 -48 minecraft:structure_block[mode=save]{mode:"SAVE",name:"minecraft:save$(save_num)_r$(room_id)",posX:0,posY:-2,posZ:48,powered:0b,sizeX:48,sizeY:48,sizeZ:48}
$setblock $(room_coords) 0 -48 minecraft:command_block{Command:"function save_sys:save_level_save {room_coords:$(room_coords)}",powered:0b}
$setblock $(room_coords) 1 -48 minecraft:redstone_block