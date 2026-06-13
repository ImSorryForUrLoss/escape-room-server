# generate room and send player into it
$tellraw @a[tag=logs] [{"color":"white","text":"running function "},{"color":"green","text":"level_join:main3"},{"color":"white","text":" with {"},{"color":"aqua","text":"room_num"},": ",{"color":"gold","text":"$(room_num)"},{"color":"white","text":", "},{"color":"aqua","text":"room_id"},": ",{"color":"gold","text":"$(room_id)"},{"color":"white","text":", "},{"color":"aqua","text":"room_coords"},": ",{"color":"gold","text":"$(room_coords)"},{"color":"white","text":"}"}]

# set spawnpoint
spawnpoint @s -128 1 0
# kill all entities in the room
fill ~ ~ ~ ~47 ~47 ~47 air
kill @e[dx=47,dy=47,dz=47,type=block_display]
tp @e[dx=47,dy=47,dz=47,tag=!Immortal] 0 -128 0
# load the room
$setblock ~ 0 -48 minecraft:structure_block[mode=load]{mode:"LOAD",name:"minecraft:$(room_id)",posX:0,posY:0,posZ:48,powered:0b,rotation:"NONE",sizeX:48,sizeY:48,sizeZ:48}
setblock ~ 2 -48 minecraft:command_block{Command:"fill ~ ~ ~ ~ ~-2 ~ minecraft:bedrock"}
setblock ~ 1 -48 minecraft:redstone_block
# send player into room
tp @s ~2 ~2 ~2
# give player the book
give @s written_book[item_name='"Utilities"',hide_additional_tooltip={},written_book_content={title:"",author:"",pages:['[{"text":"     ","bold":false},{"text":"SAVE SYSTEM","color":"#505F66","bold":true,"underlined":true},{"text":" ℹ","color":"#4488FF","bold":false,"hoverEvent":{"action":"show_text","value":[{"text":"A system for saving. Thank you for coming to my TED talk."}]}},{"text":"\\n            v1.0","color":"#BBBBBB"},{"text":"\\n\\nSave Slot:\\n","color":"gray"},{"text":"ALPHA ","color":"#8F7724","italic":true},{"text":"[SAVE]","color":"#22AA22","bold":true,"clickEvent":{"action":"run_command","value":"/trigger z_backend_server_util set 80101"}}," ",{"text":"[LOAD]","color":"#9911CC","bold":true,"clickEvent":{"action":"run_command","value":"/trigger z_backend_server_util set 80201"}},{"text":"\\n\\nSave Slot:\\n","color":"gray"},{"text":"BETA ","color":"#8F7724","italic":true},{"text":"-","color":"#FFFAEE"},{"text":"[SAVE]","color":"#22AA22","bold":true,"clickEvent":{"action":"run_command","value":"/trigger z_backend_server_util set 80102"}}," ",{"text":"[LOAD]","color":"#9911CC","bold":true,"clickEvent":{"action":"run_command","value":"/trigger z_backend_server_util set 80202"}},{"text":"\\n\\nSave Slot:\\n","color":"gray"},{"text":"GAMMA ","color":"#8F7724","italic":true},{"text":"[SAVE]","color":"#22AA22","bold":true,"clickEvent":{"action":"run_command","value":"/trigger z_backend_server_util set 80103"}}," ",{"text":"[LOAD]","color":"#9911CC","bold":true,"clickEvent":{"action":"run_command","value":"/trigger z_backend_server_util set 80203"}},{"text":"\\n\\nSave Slot:\\n","color":"gray"},{"text":"DELTA ","color":"#8F7724","italic":true},{"text":"[SAVE]","color":"#22AA22","bold":true,"clickEvent":{"action":"run_command","value":"/trigger z_backend_server_util set 80104"}}," ",{"text":"[LOAD]","color":"#9911CC","bold":true,"clickEvent":{"action":"run_command","value":"/trigger z_backend_server_util set 80204"}}]','["     ",{"text":"HINT SYSTEM","color":"#505F66","bold":true,"underlined":true},{"text":" ℹ","color":"#4488FF","bold":false,"hoverEvent":{"action":"show_text","value":[{"text":"A System for ints of type H"}]}},{"text":"\\n            v1.0","color":"#BBBBBB"},{"text":"\\n\\ngl ur on your on"},{"text":"\\n\\n\\n\\n\\n\\n\\n\\n???","color":"#EEEEEE","bold":true,"hoverEvent":{"action":"show_text","value":[{"text":"Heres a fun little secret: yknow that /trigger command that does nothing? well if you do /trigger z_backend_server_util set 801XX you can make up to 100 saves! just change XX to the save number you want! to load a save, change the number to 802XX, with XX as the save number you want to load"}]}}]']}] 1
# repair walls
fill ~-8 ~-8 ~-8 ~55 ~55 ~-1 bedrock
fill ~-8 ~-8 ~ ~-1 ~55 ~55 bedrock
fill ~48 ~-8 ~ ~55 ~55 ~55 bedrock
fill ~ ~-8 ~48 ~47 ~55 ~55 bedrock
fill ~ ~-1 ~ ~47 ~-8 ~47 bedrock
fill ~ ~48 ~ ~47 ~55 ~47 barrier
# clear forceload
forceload remove ~-16 ~-16 ~64 ~64