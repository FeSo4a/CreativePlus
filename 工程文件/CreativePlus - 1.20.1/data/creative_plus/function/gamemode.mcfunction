# 用trigger开关
scoreboard objectives add gamerule_gamemode trigger
scoreboard players enable @a gamerule_gamemode
# 命令提示
execute if entity @a[tag=creative_op,scores={gamerule_gamemode=1..}] run scoreboard players add "准则" gamerule_gamemode 1
execute if score "准则" gamerule_gamemode matches 2.. run scoreboard players set "准则" gamerule_gamemode 0
execute as @a[tag=!creative_op,scores={gamerule_gamemode=1..}] run tellraw @s [{"text":"你没有使用该命令的权限","color":"dark_red"}]
execute as @a[tag=creative_op,scores={gamerule_gamemode=1..}] run tellraw @s [{"text":"命令执行成功，当前参数：","color":"green"},{"score":{"objective":"gamerule_gamemode","name":"\"准则\""},"color":"green"}]
# 重置
scoreboard players set @a[scores={gamerule_gamemode=1..}] gamerule_gamemode 0

# 非op调整游戏模式
scoreboard objectives add creative_gamemode trigger
scoreboard players enable @a creative_gamemode
# 更改游戏模式
execute if score "准则" gamerule_gamemode matches 1.. run gamemode creative @a[scores={creative_gamemode=1}]
execute if score "准则" gamerule_gamemode matches 1.. run gamemode survival @a[scores={creative_gamemode=2}]
execute if score "准则" gamerule_gamemode matches 1.. run gamemode adventure @a[scores={creative_gamemode=3}]
execute if score "准则" gamerule_gamemode matches 1.. run gamemode spectator @a[scores={creative_gamemode=4}]
# T显
execute if score "准则" gamerule_gamemode matches 1.. run tellraw @a[scores={creative_gamemode=1}] {"text":"已将自己的游戏模式调整为创造模式","color":"green"}
execute if score "准则" gamerule_gamemode matches 1.. run tellraw @a[scores={creative_gamemode=2}] {"text":"已将自己的游戏模式调整为生存模式","color":"green"}
execute if score "准则" gamerule_gamemode matches 1.. run tellraw @a[scores={creative_gamemode=3}] {"text":"已将自己的游戏模式调整为冒险模式","color":"green"}
execute if score "准则" gamerule_gamemode matches 1.. run tellraw @a[scores={creative_gamemode=4}] {"text":"已将自己的游戏模式调整为旁观模式","color":"green"}
execute if score "准则" gamerule_gamemode matches 0 run tellraw @a[scores={creative_gamemode=1..}] {"text":"你没有使用该命令的权限","color":"dark_red"}
# 声音
execute as @a[scores={creative_gamemode=1..}] at @s if score "准则" gamerule_gamemode matches 1.. run playsound minecraft:entity.experience_orb.pickup music @s ~ ~ ~
# 重置
scoreboard players set @a[scores={creative_gamemode=1..}] creative_gamemode 0