# send the player to the 
tellraw @a[tag=logs] [{"color":"white","text":"running function "},{"color":"green","text":"main:trig_back"},{"color":"white","text":" with {}"}]

scoreboard players set @s back 0
# send the player to the lobby
execute at @s run function main:new_join