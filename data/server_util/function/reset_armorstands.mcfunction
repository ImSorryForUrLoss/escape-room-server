# replace the utility armorstands needed for detecting chunkloading
# needs rooms

# kill stands
execute as @e[type=minecraft:armor_stand] run say im a stand!
kill @e[type=armor_stand,tag=Immortal]

# respawn stands
scoreboard players set temp_timer_index misc 1
$function server_util:reset_armorstands_loop {i:1, max:$(rooms), roomCoords:512}