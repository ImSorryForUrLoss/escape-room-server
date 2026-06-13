# handle new player login
$tellraw @a[tag=logs] [{"color":"white","text":"running function "},{"color":"green","text":"main:login_checker_end"},{"color":"white","text":" with {"},{"color":"aqua","text":"room_num"},": ",{"color":"gold","text":"$(room_num)"},{"color":"white","text":"}"}]

# check if player id matches stored id for this room
$data modify storage minecraft:data loginCheckerEnd.room_id set from storage minecraft:data roomIds.$(room_num)
# try to store player id in same location, will fail if same
$execute store result score $(room_num) lvlId run data modify storage minecraft:data loginCheckerEnd.room_id set from entity @n[tag=new] UUID
$execute unless score $(room_num) lvlId matches 1 run tag @a remove new
$execute unless score $(room_num) lvlId matches 1 run return 1
# player should not be here, send them back to lobby
say GET MURDERED
execute as @n[tag=new] at @s run function main:join_hub