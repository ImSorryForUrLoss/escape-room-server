# fetch data needed for level_join_prep
$tellraw @a[tag=logs] [{"color":"white","text":"running function "},{"color":"green","text":"levl_join_tweaks:lobby_level_join"},{"color":"white","text":" with {"},{"color":"aqua","text":"roomId"},": ",{"color":"gold","text":"$(roomId)"},{"color":"white","text":"}"}]

# yes this means this func only works when run by a command block
execute store result storage minecraft:data lobbyLevelJoin.room_num byte 0.001953125 run data get block ~ ~ ~ x
execute store result storage minecraft:data lobbyLevelJoin.room_coords int 512 run data get storage minecraft:data lobbyLevelJoin.room_num 1

$data modify storage minecraft:data lobbyLevelJoin.room_id set value $(roomId)

execute as @p[distance=0..32,gamemode=!spectator] at @s run function level_join_tweaks:level_join_prep with storage minecraft:data lobbyLevelJoin