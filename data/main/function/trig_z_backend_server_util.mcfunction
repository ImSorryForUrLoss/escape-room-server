execute unless score @s z_backend_server_util matches 80000..89999 run return run tellraw @s "This trigger is used to allow written books to run certain commands and is not meant for regular usage."
execute if score @s z_backend_server_util matches 80100..80199 run return run function save_book:bsu_save
execute if score @s z_backend_server_util matches 80200..80299 run return run function save_book:bsu_load
say ono