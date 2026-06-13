# spoopy scary math, then run level_tweaks:anti_item_rng_end
tellraw @a[tag=logs_spam] [{"color":"white","text":"running function "},{"color":"green","text":"level_tweaks:anti_item_rng_main"},{"color":"white","text":" with {}"}]

# get item pos with 5 decimal places of percision but it's negative so it's 1 minus it i think idk why this works
execute store result score itemX level_tweaks run data get entity @s Pos[0] -100000
execute store result score itemY level_tweaks run data get entity @s Pos[1] -100000
execute store result score itemZ level_tweaks run data get entity @s Pos[2] -100000

# modulo by 100000 for decimal part
scoreboard players operation itemX level_tweaks %= 100000 level_tweaks
scoreboard players operation itemY level_tweaks %= 100000 level_tweaks
scoreboard players operation itemZ level_tweaks %= 100000 level_tweaks

# subtract offsets to get final motion values
scoreboard players operation itemX level_tweaks -= offsetXZ level_tweaks
scoreboard players operation itemY level_tweaks -= offsetY level_tweaks
scoreboard players operation itemZ level_tweaks -= offsetXZ level_tweaks

# apply motion to item
execute store result entity @s Motion[0] double 0.00001 run scoreboard players get itemX level_tweaks
execute store result entity @s Motion[1] double 0.00001 run scoreboard players get itemY level_tweaks
execute store result entity @s Motion[2] double 0.00001 run scoreboard players get itemZ level_tweaks

# run cleanup function next tick
scoreboard players set rng_end level_tweaks 1