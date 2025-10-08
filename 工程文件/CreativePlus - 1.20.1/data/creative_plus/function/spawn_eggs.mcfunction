# 用trigger开关
scoreboard objectives add gamerule_eggs trigger
scoreboard players enable @a gamerule_eggs
# 命令提示
execute if entity @a[tag=creative_op,scores={gamerule_eggs=1..}] run scoreboard players add "准则" gamerule_eggs 1
execute if score "准则" gamerule_eggs matches 2.. run scoreboard players set "准则" gamerule_eggs 0
execute as @a[tag=!creative_op,scores={gamerule_eggs=1..}] run tellraw @s [{"text":"你没有使用该命令的权限","color":"dark_red"}]
execute as @a[tag=creative_op,scores={gamerule_eggs=1..}] run tellraw @s [{"text":"命令执行成功，当前参数：","color":"green"},{"score":{"objective":"gamerule_eggs","name":"\"准则\""},"color":"green"}]
# 重置
scoreboard players set @a[scores={gamerule_eggs=1..}] gamerule_eggs 0

# 清除蛋
execute if score "准则" gamerule_eggs matches 1.. run clear @a[tag=!creative_op] minecraft:egg
execute if score "准则" gamerule_eggs matches 1.. run clear @a[tag=!creative_op] #minecraft:spawn_eggs