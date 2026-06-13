# if the player is tagged as in a level, remove that tag and mark the level as free, and set level index for speedrun timer
$tellraw @a[tag=logs] [{"color":"white","text":"running function "},{"color":"green","text":"main:lvl_complete"},{"color":"white","text":" with {"},{"color":"aqua","text":"i"},": ",{"color":"gold","text":"$(i)"},{"color":"white","text":"}"}]

# increment index
$execute unless entity @s[tag=$(i)] run scoreboard players set temp_tags misc $(i)
$execute unless entity @s[tag=$(i)] run scoreboard players add temp_tags misc 1
# get new index val and rerun if fail
$execute unless entity @s[tag=$(i)] store result storage minecraft:data tags.i int 1 run scoreboard players get temp_tags misc
$execute unless entity @s[tag=$(i)] unless score temp_tags misc matches 21 run function main:lvl_complete with storage minecraft:data tags
# if success do stuff
$execute if entity @s[tag=$(i)] run data modify storage minecraft:data roomSpaces.$(i) set value free
$execute if entity @s[tag=$(i)] run data modify storage minecraft:data speedrunTimer.data.i set value $(i)
$execute if entity @s[tag=$(i)] run tag @s remove $(i)