# handle /trigger commands

execute as @a unless score @s rules matches 0 run function main:trig_rules
execute as @a unless score @s back matches 0 run function main:trig_back
execute as @a unless score @s hub matches 0 run function main:trig_hub
execute as @a unless score @s discord matches 0 run function main:trig_discord
execute as @a unless score @s spoiler matches 0 run function main:trig_spoiler
execute as @a unless score @s z_backend_server_util matches 0 run function main:trig_z_backend_server_util

scoreboard players enable @a rules
scoreboard players enable @a back
scoreboard players enable @a hub
scoreboard players enable @a discord
scoreboard players enable @a spoiler
scoreboard players enable @a z_backend_server_util

scoreboard players set @a z_backend_server_util 0

schedule function main:trigger_checker 2t