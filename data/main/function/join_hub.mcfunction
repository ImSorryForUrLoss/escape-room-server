# send the player to the lobby
tellraw @a[tag=logs] [{"color":"white","text":"running function "},{"color":"green","text":"main:join_hub"},{"color":"white","text":" with {}"}]

execute unless entity @p[distance=0..3] run return fail
tag @s remove new
tag @s remove dark
tag @s add inLobby
spawnpoint @s 0 1 -13 0
gamemode adventure @s
kill @s
# if the player is tagged as in a level, remove that tag and mark the level as free
function main:lvl_complete {i:1}