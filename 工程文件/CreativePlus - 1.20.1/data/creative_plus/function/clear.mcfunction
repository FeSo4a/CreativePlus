# 用trigger开关
scoreboard objectives add gamerule_clear trigger
scoreboard players enable @a gamerule_clear
# 命令提示
execute if entity @a[tag=creative_op,scores={gamerule_clear=1..}] run scoreboard players add "准则" gamerule_clear 1
execute if score "准则" gamerule_clear matches 2.. run scoreboard players set "准则" gamerule_clear 0
execute as @a[tag=!creative_op,scores={gamerule_clear=1..}] run tellraw @s [{"text":"你没有使用该命令的权限","color":"dark_red"}]
execute as @a[tag=creative_op,scores={gamerule_clear=1..}] run tellraw @s [{"text":"命令执行成功，当前参数：","color":"green"},{"score":{"objective":"gamerule_clear","name":"\"准则\""},"color":"green"}]
# 重置
scoreboard players set @a[scores={gamerule_clear=1..}] gamerule_clear 0

# 清理掉落物
execute if score "准则" gamerule_clear matches 1.. run kill @e[type=item]