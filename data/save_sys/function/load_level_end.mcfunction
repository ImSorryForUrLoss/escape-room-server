# idr what this does tbh
$tellraw @a[tag=logs] [{"color":"white","text":"running function "},{"color":"green","text":"save_sys:load_level_end"},{"color":"white","text":" with {"},{"color":"aqua","text":"room_id"},": ",{"color":"gold","text":"$(room_id)"},{"color":"white","text":", "},{"color":"aqua","text":"room_coords"},": ",{"color":"gold","text":"$(room_coords)"},{"color":"white","text":"}"}]

fill ~ ~ ~ ~ ~-2 ~ bedrock

$execute as @p[tag=$(room_id)] positioned $(room_coords) 0 0 positioned ~47 ~ ~47 run function save_sys:load_level_items

# kill second armorstand to prevent entity buildup
# extra check just in case
scoreboard players set stand_count save_sys 0
$execute as @e[type=minecraft:armor_stand,tag=$(room_id)] run scoreboard players add stand_count save_sys 1
$execute unless score stand_count save_sys matches ..1 run kill @n[type=armor_stand,tag=$(room_id)]