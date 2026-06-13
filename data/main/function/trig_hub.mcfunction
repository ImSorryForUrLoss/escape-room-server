# send the player to the 
tellraw @a[tag=logs] [{"color":"white","text":"running function "},{"color":"green","text":"main:trig_hub"},{"color":"white","text":" with {}"}]

scoreboard players set @s hub 0
# send the player to the lobby
execute at @s run function main:join_hub