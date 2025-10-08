# 用trigger开关
scoreboard objectives add gamerule_night_vision trigger
scoreboard players enable @a gamerule_night_vision
# 命令提示
execute if entity @a[tag=creative_op,scores={gamerule_night_vision=1..}] run scoreboard players add "准则" gamerule_night_vision 1
execute if score "准则" gamerule_night_vision matches 2.. run scoreboard players set "准则" gamerule_night_vision 0
execute as @a[tag=!creative_op,scores={gamerule_night_vision=1..}] run tellraw @s [{"text":"你没有使用该命令的权限","color":"dark_red"}]
execute as @a[tag=creative_op,scores={gamerule_night_vision=1..}] run tellraw @s [{"text":"命令执行成功，当前参数：","color":"green"},{"score":{"objective":"gamerule_night_vision","name":"\"准则\""},"color":"green"}]
# 重置
scoreboard players set @a[scores={gamerule_night_vision=1..}] gamerule_night_vision 0

# 夜视计分板
scoreboard objectives add night_vision trigger
scoreboard players enable @a night_vision
scoreboard objectives add trigger_night_vision dummy
# 控制是否夜视
execute if score "准则" gamerule_night_vision matches 1.. run scoreboard players add @a[scores={night_vision=1..}] trigger_night_vision 1
execute if score "准则" gamerule_night_vision matches 1.. run scoreboard players set @a[scores={trigger_night_vision=2..}] trigger_night_vision 0
# T显及声音
execute if score "准则" gamerule_night_vision matches 1.. run tellraw @a[scores={night_vision=1..,trigger_night_vision=1}] {"text":"夜视已开启！","color":"green"}
execute if score "准则" gamerule_night_vision matches 1.. run tellraw @a[scores={night_vision=1..,trigger_night_vision=0}] {"text":"夜视已关闭！","color":"red"}
execute as @a[scores={night_vision=1..}] at @s if score "准则" gamerule_night_vision matches 1.. run playsound minecraft:entity.experience_orb.pickup music @s ~ ~ ~
# 准则为false时
execute if score "准则" gamerule_night_vision matches 0 run tellraw @a[scores={night_vision=1..}] {"text":"你没有使用该命令的权限！","color":"dark_red"}
execute if score "准则" gamerule_night_vision matches 0 run scoreboard players set @a trigger_night_vision 0
# 添加效果、重置
execute if score "准则" gamerule_night_vision matches 1.. run effect give @a[scores={trigger_night_vision=1}] minecraft:night_vision 3 0 true
scoreboard players set @a[scores={night_vision=1..}] night_vision 0
