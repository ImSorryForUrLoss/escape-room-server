# handle writable book for /trigger spoiler
tellraw @a[tag=logs] [{"color":"white","text":"running function "},{"color":"green","text":"level_tweaks:spoiler_writable"},{"color":"white","text":" with {}"}]

tellraw @a [{"text":"<"},{"selector":"@p"},{"text":"> "},{"hoverEvent":{"action":"show_text","contents":{"block":"0 128 0","source":"block","nbt":"Items[{id:\"minecraft:writable_book\"}].components.\"minecraft:writable_book_content\".pages[0].raw"}},"text":"[Spoiler - Hover]"}]