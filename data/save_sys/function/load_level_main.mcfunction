# generate room and send player into it
$tellraw @a[tag=logs] [{"color":"white","text":"running function "},{"color":"green","text":"save_sys:load_level_main"},{"color":"white","text":" with {"},{"color":"aqua","text":"room_id"},": ",{"color":"gold","text":"$(room_id)"},{"color":"white","text":", "},{"color":"aqua","text":"room_coords"},": ",{"color":"gold","text":"$(room_coords)"},{"color":"white","text":", "},{"color":"aqua","text":"save_num"},": ",{"color":"gold","text":"$(save_num)"},{"color":"white","text":"}"}]

# set spawnpoint
spawnpoint @s -128 1 0
# kill all entities in the room
fill ~ ~ ~ ~47 ~47 ~47 air
kill @e[dx=47,dy=47,dz=47,type=block_display]
tp @e[dx=47,dy=47,dz=47,tag=!Immortal,tag=!player_pos] 0 -128 0
# load the room
$setblock ~ 0 -48 minecraft:structure_block[mode=load]{ignoreEntities:0b,mode:"LOAD",name:"minecraft:save$(save_num)_r$(room_id)",posX:0,posY:0,posZ:48,powered:0b,sizeX:48,sizeY:48,sizeZ:48}
$setblock ~ 2 -48 minecraft:command_block{Command:"function save_sys:load_level_end {room_id:$(room_id), room_coords:$(room_coords)}",SuccessCount:0,TrackOutput:1b,UpdateLastExecution:1b,auto:0b,conditionMet:0b,powered:0b}
setblock ~ 1 -48 minecraft:redstone_block
# send player into room
tp @s @n[tag=player_pos]
execute unless entity @n[tag=player_pos] positioned ~ 0 0 run tp @s ~2 ~2 ~2
kill @n[tag=player_pos]
# repair walls
fill ~-8 ~-8 ~-8 ~55 ~55 ~-1 bedrock
fill ~-8 ~-8 ~ ~-1 ~55 ~55 bedrock
fill ~48 ~-8 ~ ~55 ~55 ~55 bedrock
fill ~ ~-8 ~48 ~47 ~55 ~55 bedrock
fill ~ ~-1 ~ ~47 ~-8 ~47 bedrock
fill ~ ~48 ~ ~47 ~55 ~47 barrier
# clear forceload
forceload remove ~-16 ~-16 ~64 ~64