# run random other stuff
execute as @e unless entity @s[x=-16,y=0,z=-16,dx=47,dy=128,dz=47,tag=inLobby] unless entity @s[x=-129,y=-500,z=-1,dx=2,dy=570,dz=2] unless entity @s[tag=admin] unless entity @s[x=512,y=0,z=0,dx=47,dy=47,dz=47] unless entity @s[x=1024,y=0,z=0,dx=47,dy=47,dz=47] unless entity @s[x=1536,y=0,z=0,dx=47,dy=47,dz=47] unless entity @s[x=2048,y=0,z=0,dx=47,dy=47,dz=47] unless entity @s[x=2560,y=0,z=0,dx=47,dy=47,dz=47] unless entity @s[x=3072,y=0,z=0,dx=47,dy=47,dz=47] unless entity @s[x=3584,y=0,z=0,dx=47,dy=47,dz=47] unless entity @s[x=4096,y=0,z=0,dx=47,dy=47,dz=47] unless entity @s[x=4608,y=0,z=0,dx=47,dy=47,dz=47] unless entity @s[x=5120,y=0,z=0,dx=47,dy=47,dz=47] unless entity @s[x=5632,y=0,z=0,dx=47,dy=47,dz=47] unless entity @s[x=6144,y=0,z=0,dx=47,dy=47,dz=47] unless entity @s[x=6656,y=0,z=0,dx=47,dy=47,dz=47] unless entity @s[x=7168,y=0,z=0,dx=47,dy=47,dz=47] unless entity @s[x=7680,y=0,z=0,dx=47,dy=47,dz=47] unless entity @s[x=8192,y=0,z=0,dx=47,dy=47,dz=47] unless entity @s[x=8704,y=0,z=0,dx=47,dy=47,dz=47] unless entity @s[x=9216,y=0,z=0,dx=47,dy=47,dz=47] unless entity @s[x=9728,y=0,z=0,dx=47,dy=47,dz=47] unless entity @s[x=10240,y=0,z=0,dx=47,dy=47,dz=47] run kill @s
execute as @a[tag=inLobby] at @s if block ~ ~-1 ~ minecraft:observer run effect give @s minecraft:speed 2 9 true
effect give @a minecraft:haste infinite 19 true
execute as @e unless entity @s[gamemode=spectator] at @s if block ~ ~ ~ minecraft:moving_piston run function main:kill_check
# make loop
schedule function main:login_checker_loop 2t

# check for new players and fail if none
scoreboard players operation pCountOld loginChecker = pCount loginChecker
execute store result score pCount loginChecker run list
execute unless score pCount loginChecker > pCountOld loginChecker run return fail

#> find new players and check if they should be sent to the lobby

# prep for login_checker_find
execute unless score pCount loginChecker matches 1 run scoreboard players set temp_timer_index misc 1
execute unless score pCount loginChecker matches 1 run execute as @a at @s run summon marker ~ ~ ~
execute unless score pCount loginChecker matches 1 run tag @p add p_0
# pretty sure this doesnt work if two people are at the same location
execute unless score pCount loginChecker matches 1 run execute at @a[tag=p_0] run tag @n[type=marker] add p_0
execute unless score pCount loginChecker matches 1 run function main:login_checker_find {i:1}

# if only 1 player, skip the whole finding loop
execute if score pCount loginChecker matches 1 run tag @p add new

# check for untested edgecase
scoreboard players set temp_new_player misc 0
execute as @a[tag=new] run scoreboard players add temp_new_player misc 1
execute unless score temp_new_player misc matches 1 run return run say ONO WHO COULD HAVE FORSEEN THIS

# check if new player is in lobby
execute as @a[tag=new] if entity @s[tag=inLobby] run return run tag @a remove new

# run login_checker_main
scoreboard players set temp_timer_index misc 0
function main:login_checker_main {i:0}