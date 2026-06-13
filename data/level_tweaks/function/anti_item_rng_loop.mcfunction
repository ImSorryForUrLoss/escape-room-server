# standardize item movement from breaking blocks

schedule function level_tweaks:anti_item_rng_loop 1t
execute if score rng_end level_tweaks matches 1 run function level_tweaks:anti_item_rng_end
execute as @e[type=item,nbt={Age:1s}] unless data entity @s Thrower run function level_tweaks:anti_item_rng_main