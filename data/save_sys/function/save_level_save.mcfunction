# idk why this was here originally but it can probably be removed soon
tellraw @a[tag=logs] [{"color":"white","text":"running function "},{"color":"green","text":"save_sys:save_level_save"},{"color":"white","text":" with {}"}]
# nvm this is actually very important as currently there is a 1t delay between saving the items and saving the world, which could cause item duping or deletion, and thats probably fine

fill ~ ~ ~ ~ ~2 ~ bedrock

say system saved