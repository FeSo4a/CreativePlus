# 用trigger开关
scoreboard objectives add gamerule_login trigger
scoreboard players enable @a gamerule_login
# 命令提示
execute if entity @a[tag=creative_op,scores={gamerule_login=1..}] run scoreboard players add "准则" gamerule_login 1
execute if score "准则" gamerule_login matches 2.. run scoreboard players set "准则" gamerule_login 0
execute as @a[tag=!creative_op,scores={gamerule_login=1..}] run tellraw @s [{"text":"你没有使用该命令的权限","color":"dark_red"}]
execute as @a[tag=creative_op,scores={gamerule_login=1..}] run tellraw @s [{"text":"命令执行成功，当前参数：","color":"green"},{"score":{"objective":"gamerule_login","name":"\"准则\""},"color":"green"}]
# 重置
scoreboard players set @a[scores={gamerule_login=1..}] gamerule_login 0

# 显示玩家进入提示
scoreboard objectives add creative_login dummy
scoreboard players add @a creative_login 0
# T显
execute as @a if score "准则" gamerule_login matches 1.. if score @s creative_login matches 0 run tellraw @a [{"text":"[系统提示] ","color":"red"},{"selector":"@s","color":"yellow"},{"text":"加入了游戏！","color":"red"}]
execute if score "准则" gamerule_login matches 1.. run tellraw @a[scores={creative_login=0}] {"text":"按T打开聊天栏，输入/trigger creative_help查看帮助","color":"aqua"}
# 重置
scoreboard players reset * creative_login
scoreboard players add @a creative_login 1