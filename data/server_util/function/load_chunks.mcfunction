# prep for reset_armorstands_loop
# needs rooms

scoreboard players set temp_timer_index misc 1
$function server_util:reset_armorstands_chunkload {i:1, max:$(rooms), roomCoords:512}