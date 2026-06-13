# make spyglass not throw a bunch of errors

team add player
scoreboard objectives add lvlSpace dummy
scoreboard objectives add misc dummy
scoreboard objectives add lvlId dummy
scoreboard objectives add loginChecker dummy
scoreboard objectives add server_util dummy
scoreboard objectives add level_tweaks dummy
scoreboard objectives add levels_completed dummy
scoreboard objectives add level_join_tweaks dummy
scoreboard objectives add save_sys dummy

scoreboard objectives add discord trigger
scoreboard objectives add rules trigger
scoreboard objectives add back trigger
scoreboard objectives add hub trigger
scoreboard objectives add spoiler trigger
scoreboard objectives add z_backend_server_util trigger

# logging format
$tellraw @a[tag=logs] [{"color":"white","text":"running function "},{"color":"green","text":"PATH:NAME"},{"color":"white","text":" with {"},{"color":"aqua","text":"VALVALVALVAL"},": ",{"color":"gold","text":"$(VALVALVALVAL)"},{"color":"white","text":"}"}]
# {"color":"white","text":", "},{"color":"aqua","text":"VALVALVALVAL"},": ",{"color":"gold","text":"$(VALVALVALVAL)"},
tellraw @a[tag=logs] [{"color":"white","text":"running function "},{"color":"green","text":"PATH:NAME"},{"color":"white","text":" with {}"}]
tellraw @a[tag=logs_spam] [{"color":"white","text":"running function "},{"color":"green","text":"PATH:NAME"},{"color":"white","text":" with {}"}]