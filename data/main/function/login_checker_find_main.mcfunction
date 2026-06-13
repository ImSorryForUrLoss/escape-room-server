$tellraw @a[tag=logs] [{"color":"white","text":"running function "},{"color":"green","text":"main:login_checker_find_main"},{"color":"white","text":" with {"},{"color":"aqua","text":"marker"},": ",{"color":"gold","text":"$(marker)"},{"color":"white","text":"}"}]

$execute positioned 0.0 0.0 0.0 run kill @e[type=marker,limit=$(marker)]
data modify storage minecraft:data loginCheckerFindMain.marker set from entity @n[type=marker] Tags[0]
function main:login_checker_find_end with storage minecraft:data loginCheckerFindMain