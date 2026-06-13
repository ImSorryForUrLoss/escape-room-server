$tellraw @a[tag=logs] [{"color":"white","text":"running function "},{"color":"green","text":"main:login_checker_find_end"},{"color":"white","text":" with {"},{"color":"aqua","text":"marker"},": ",{"color":"gold","text":"$(marker)"},{"color":"white","text":"}"}]

$tag @a[tag=$(marker)] add new
say Found new player(s): @e[tag=new]
kill @e[type=marker]
scoreboard players set temp_index misc 0
function main:login_checker_find_cleanup {i:0}