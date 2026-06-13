$tellraw @a[tag=logs] [{"color":"white","text":"running function "},{"color":"green","text":"level_join_tweaks:lobby_transfer"},{"color":"white","text":" with {"},{"color":"aqua","text":"roomId"},": ",{"color":"gold","text":"$(roomId)"},{"color":"white","text":"}"}]

execute store result score roomCoords level_join_tweaks run data get block ~ ~ ~ x
scoreboard players operation roomCoords level_join_tweaks /= 512 level_tweaks
execute store result storage minecraft:data lobbyTransfer.roomNum short 1 run scoreboard players get roomCoords level_join_tweaks
$data modify storage minecraft:data lobbyTransfer.roomId set value $(roomId)
execute as @p[distance=0..32,gamemode=!spectator] at @s run function level_join:main2_prep with storage minecraft:data lobbyTransfer