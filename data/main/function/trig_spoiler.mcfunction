# give the player a dc invite
tellraw @a[tag=logs] [{"color":"white","text":"running function "},{"color":"green","text":"main:trig_spoiler"},{"color":"white","text":" with {}"}]

scoreboard players set @s spoiler 0

item replace block 0 128 0 container.0 from entity @s weapon.mainhand
execute if block 0 128 0 minecraft:barrel{Items:[{id:"minecraft:writable_book"}]} run return run function level_tweaks:spoiler_writable
execute if block 0 128 0 minecraft:barrel{Items:[{id:"minecraft:written_book"}]} run return run function level_tweaks:spoiler_written
tellraw @s [{"color":"#8888AA","hoverEvent":{"action":"show_text","value":[{"text":"","color":"#8888AA","italic":false,"underlined":false}]},"text":"Write your message in the book and quill, to send it, run ","underlined":false},{"clickEvent":{"action":"run_command","value":"/trigger spoiler"},"color":"blue","hoverEvent":{"action":"show_text","value":[{"text":"Run /trigger spoiler","color":"white"}]},"text":"/trigger spoiler","underlined":true},{"color":"#8888AA","text":" with it in your hand, you can also sign the book to add a description of what you are spoiling!","underlined":false}]
give @s minecraft:writable_book