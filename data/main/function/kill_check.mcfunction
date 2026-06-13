# roundabout way to not make pistons kill people
tellraw @a[tag=logs] [{"color":"white","text":"running function "},{"color":"green","text":"main:kill_check"},{"color":"white","text":" with {}"}]

# it seems there is a bug where /setblocked moving_pistons simultaneously do and do not have nbt data, making them always return fail for checks
execute if data block ~ ~ ~ facing run return fail
kill @s