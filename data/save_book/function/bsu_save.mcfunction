say saving
scoreboard players set temp_space save_sys 80100
scoreboard players operation temp_space save_sys -= @s z_backend_server_util
scoreboard players operation temp_space save_sys *= -1 save_sys

execute store result storage minecraft:save_sys save_num.save_num int 1 run scoreboard players get temp_space save_sys
function save_sys:save_level_prep with storage save_sys save_num