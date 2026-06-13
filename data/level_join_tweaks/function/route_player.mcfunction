# figure out which room the player is in and run route_player2 for that room
$tellraw @a[tag=logs] [{"color":"white","text":"running function "},{"color":"green","text":"level_join_tweaks:route_player"},{"color":"white","text":" with {"},{"color":"aqua","text":"i"},": ",{"color":"gold","text":"$(i)"},{"color":"white","text":"}"}]

# increment index
$scoreboard players set temp_route misc $(i)
scoreboard players add temp_route misc 1
# if success do stuff
$execute if entity @s[tag=$(i)] run return run function level_join_tweaks:route_player2 {roomNum:$(i)}
# if the player isnt in a room, they either ran /trigger hub in the hub, or logged in for the first time
execute if score temp_route misc matches 21 run return run function main:join_hub
# get new index val and rerun if fail
execute store result storage minecraft:data tags.i int 1 run scoreboard players get temp_route misc
function level_join_tweaks:route_player with storage minecraft:data tags