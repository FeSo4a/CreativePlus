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

# 计时计分板
scoreboard objectives add creative_cleaner dummy
scoreboard players add "扫地机器人" creative_cleaner 1
# 在30s,3s,2s,1s时分别出现提示
execute if score "准则" gamerule_clear matches 1.. if score "扫地机器人" creative_cleaner matches 11400 run tellraw @a "30秒后清理掉落物"
execute if score "准则" gamerule_clear matches 1.. if score "扫地机器人" creative_cleaner matches 11940 run tellraw @a {"text":"3秒后清理掉落物","color":"blue"}
execute if score "准则" gamerule_clear matches 1.. if score "扫地机器人" creative_cleaner matches 11960 run tellraw @a {"text":"2秒后清理掉落物","color":"yellow"}
execute if score "准则" gamerule_clear matches 1.. if score "扫地机器人" creative_cleaner matches 11980 run tellraw @a {"text":"1秒后清理掉落物","color":"red"}
# 清理掉落物并显示提示
execute if score "准则" gamerule_clear matches 1.. if score "扫地机器人" creative_cleaner matches 12000 run tellraw @a {"text":"掉落物清理完毕","color":"green"}
execute if score "准则" gamerule_clear matches 1.. if score "扫地机器人" creative_cleaner matches 12000.. run kill @e[type=minecraft:item]
# 复原
execute if score "扫地机器人" creative_cleaner matches 12000.. run scoreboard players set "扫地机器人" creative_cleaner 0