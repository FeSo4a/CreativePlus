# 若有creative_ban而无in_banlist，则封禁
execute as @a[tag=creative_ban] if entity @s[tag=!in_banlist] run tellraw @a [{"selector":"@s","color":"yellow"},{"text":"已被管理员封禁！","color":"dark_red"}]
execute as @a[tag=creative_ban] at @s if entity @s[tag=!in_banlist] run playsound entity.ender_dragon.ambient music @s ~ ~ ~
execute as @a[tag=creative_ban] if entity @s[tag=!in_banlist] run tag @s add in_banlist
execute as @a[tag=creative_ban] run tag @s remove creative_ban

# 实行封禁
execute as @a[tag=in_banlist] run tp @s 114514 1145 114514
execute as @a[tag=in_banlist] run clear @s
execute as @a[tag=in_banlist] run gamemode spectator @s
execute as @a[tag=in_banlist] run title @s actionbar {"text":"你已被封禁！","color":"red"}

# 若有creative_ban和in_banlist，则解封
execute as @a[tag=creative_ban] if entity @s[tag=in_banlist] run tellraw @a [{"selector":"@s","color":"aqua"},{"text":"已被管理员解除封禁！","color":"green"}]
execute as @a[tag=creative_ban] at @s if entity @s[tag=in_banlist] run playsound entity.experience_orb.pickup music @s ~ ~ ~
execute as @a[tag=creative_ban] if entity @s[tag=in_banlist] run tag @s remove in_banlist
execute as @a[tag=creative_ban] run tag @s remove creative_ban