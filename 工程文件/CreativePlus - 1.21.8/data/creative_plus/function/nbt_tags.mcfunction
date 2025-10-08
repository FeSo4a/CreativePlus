# 用trigger开关
scoreboard objectives add gamerule_nbt trigger
scoreboard players enable @a gamerule_nbt
# 命令提示
execute if entity @a[tag=creative_op,scores={gamerule_nbt=1..}] run scoreboard players add "准则" gamerule_nbt 1
execute if score "准则" gamerule_nbt matches 2.. run scoreboard players set "准则" gamerule_nbt 0
execute as @a[tag=!creative_op,scores={gamerule_nbt=1..}] run tellraw @s [{"text":"你没有使用该命令的权限","color":"dark_red"}]
execute as @a[tag=creative_op,scores={gamerule_nbt=1..}] run tellraw @s [{"text":"命令执行成功，当前参数：","color":"green"},{"score":{"objective":"gamerule_nbt","name":"\"准则\""},"color":"green"}]
# 重置
scoreboard players set @a[scores={gamerule_nbt=1..}] gamerule_nbt 0


# 检测玩家是否持有nbt物品

# 检测手的
execute as @a[tag=!creative_op] if score "准则" gamerule_nbt matches 1.. if data entity @s SelectedItem.components run item replace entity @s weapon.mainhand with air 1
execute as @a[tag=!creative_op] if score "准则" gamerule_nbt matches 1.. if data entity @s equipment.offhand.components run item replace entity @s weapon.offhand with air 1
# 检测身体的
execute as @a[tag=!creative_op] if score "准则" gamerule_nbt matches 1.. if data entity @s equipment.head.components run item replace entity @s armor.head with air 1
execute as @a[tag=!creative_op] if score "准则" gamerule_nbt matches 1.. if data entity @s equipment.chest.components run item replace entity @s armor.chest with air 1
execute as @a[tag=!creative_op] if score "准则" gamerule_nbt matches 1.. if data entity @s equipment.legs.components run item replace entity @s armor.legs with air 1
execute as @a[tag=!creative_op] if score "准则" gamerule_nbt matches 1.. if data entity @s equipment.feet.components run item replace entity @s armor.feet with air 1
