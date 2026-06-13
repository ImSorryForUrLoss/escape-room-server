# give items a small upward motion to simulate normal item movement
tellraw @a[tag=logs_spam] [{"color":"white","text":"running function "},{"color":"green","text":"level_tweaks:anti_item_rng_end"},{"color":"white","text":" with {}"}]

scoreboard players set rng_end level_tweaks 0
execute as @e[type=item, nbt={Age:2s}] run data modify entity @s Motion set value [0.0d, 0.1395d, 0.0d]