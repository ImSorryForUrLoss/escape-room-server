# update current time and run timer_check every 15 seconds
# also for some reason run team join player @a and make items not despawn and give sat

schedule function main:timer_loop 15s
execute store result score temp_cur_time misc run data get block 0 8 128 LastExecution
function main:timer_check {i:1}
# THIS IS UNRELATED TO EVERYTHING ELSE
team join player @a
execute as @e[type=item] unless entity @s[nbt={Age:0s}] unless entity @s[nbt={Age:1s}] unless entity @s[nbt={Age:2s}] unless entity @s[nbt={Age:3s}] run data modify entity @s Age set value -32768
effect give @a saturation infinite 0 true