# get level data for save_level
$tellraw @a[tag=logs] [{"color":"white","text":"running function "},{"color":"green","text":"save_sys:save_level_prep"},{"color":"white","text":" with {"},{"color":"aqua","text":"save_num"},": ",{"color":"gold","text":"$(save_num)"},{"color":"white","text":"}"}]

execute store result storage save_sys save_level.room_id int 1 run data get entity @s Pos[0] 0.00195694716242661448140900195695
execute store result storage save_sys save_level.room_coords int 512 run data get entity @s Pos[0] 0.00195694716242661448140900195695
$data modify storage save_sys save_level.save_num set value $(save_num)

execute store result score save_num save_sys run data get storage save_sys save_level.room_id 1
execute unless score save_num save_sys matches 1..20 run return run say thou shalt not save unless the need is dire

function save_sys:save_level with storage save_sys save_level