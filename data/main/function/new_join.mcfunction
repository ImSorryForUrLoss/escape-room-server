# send the player to their last room
tellraw @a[tag=logs] [{"color":"white","text":"running function "},{"color":"green","text":"main:new_join"},{"color":"white","text":" with {}"}]

execute unless entity @p[distance=0..3] run return fail
tag @s remove new
tag @s remove dark
# handle player routing
function level_join_tweaks:route_player {i:1}