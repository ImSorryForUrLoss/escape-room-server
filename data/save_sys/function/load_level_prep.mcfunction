# get level data for load_level
$tellraw @a[tag=logs] [{"color":"white","text":"running function "},{"color":"green","text":"save_sys:load_level_prep"},{"color":"white","text":" with {"},{"color":"aqua","text":"save_num"},": ",{"color":"gold","text":"$(save_num)"},{"color":"white","text":"}"}]

execute store result storage save_sys load_level.room_id int 1 run data get entity @s Pos[0] 0.00195694716242661448140900195695
execute store result storage save_sys load_level.room_coords int 512 run data get entity @s Pos[0] 0.00195694716242661448140900195695
$data modify storage save_sys load_level.save_num set value $(save_num)

# abort if player is at spawn
execute store result score temp_player_room misc run data get entity @s Pos[0] 0.00195694716242661448140900195695
execute if score temp_player_room misc matches ..0 run return run say uhhhh idk what you did but stop doing it please thanks

function save_sys:load_level with storage save_sys load_level

# main2_prep: run main2 with room_id, room_num, and room_coords

# main: reset player
# main2: forceload and run main2.1 next tick
# main2.1: loop until chunks load and run main3