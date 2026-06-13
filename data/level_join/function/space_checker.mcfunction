# finds a free room and runs main for that room
$tellraw @a[tag=logs] [{"color":"white","text":"running function "},{"color":"green","text":"level_join:space_checker"},{"color":"white","text":" with {"},{"color":"aqua","text":"roomNum"},": ",{"color":"gold","text":"$(roomNum)"},{"color":"white","text":", "},{"color":"aqua","text":"roomId"},": ",{"color":"gold","text":"$(roomId)"},{"color":"white","text":"}"}]

# if room space is free, run main
$execute if data storage minecraft:data roomSpaces.$(roomNum) run data remove storage minecraft:room_data room_1
$execute if data storage minecraft:data roomSpaces.$(roomNum) as @p[tag=!spectator] run return run function level_join:main {room_num:$(roomNum),room_id:$(roomId)}
# if no rooms are free, tell player
execute if score temp_space_count misc matches 20 run tellraw @p[gamemode=!spectator] {"color":"red","text":"Sorry! Unable to find any free lobbies, try again later"}
execute if score temp_space_count misc matches 20 run return 0
# otherwise, check next room
$scoreboard players set temp_space_count misc $(roomNum)
scoreboard players add temp_space_count misc 1

execute store result storage minecraft:data spaceChecker.roomNum int 1 run scoreboard players get temp_space_count misc
$data modify storage minecraft:data spaceChecker.roomId set value $(roomId)
function level_join:space_checker with storage minecraft:data spaceChecker