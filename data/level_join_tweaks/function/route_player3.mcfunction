# send player into room_dir[0]
say how did you get here im pretty sure this function is unused???

scoreboard players operation roomCoords level_join_tweaks /= 512 level_tweaks
execute store result storage minecraft:data lobbyLevelJoin.roomNum short 1 run scoreboard players get roomCoords level_join_tweaks
$data modify storage minecraft:data lobbyLevelJoin.roomId set value $(roomId)
execute as @p[distance=0..32,gamemode=!spectator] at @s run function level_join:main with storage minecraft:data lobbyLevelJoin