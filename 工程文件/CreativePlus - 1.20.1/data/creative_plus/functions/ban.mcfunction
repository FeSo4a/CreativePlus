# 实行封禁
execute as @a[tag=in_banlist] run tp @s 114514 1145 114514
execute as @a[tag=in_banlist] run clear @s
execute as @a[tag=in_banlist] run gamemode spectator @s
execute as @a[tag=in_banlist] run title @s actionbar {"text":"你已被封禁！","color":"red"}