# give the player a dc invite
tellraw @a[tag=logs] [{"color":"white","text":"running function "},{"color":"green","text":"main:trig_discord"},{"color":"white","text":" with {}"}]

scoreboard players set @s discord 0
tellraw @s {"text":"Click here to join the Blocked In Discord server!","color":"blue","underlined":true,"hoverEvent":{"action":"show_text","value":[{"text":"If the link doesn't work let us know... somehow"}]},"clickEvent":{"action":"open_url","value":"https://discord.gg/hPyDXc3MTg"}}