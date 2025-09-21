# 添加trigger
scoreboard objectives add gamerule_beds trigger
scoreboard players enable @a gamerule_beds
# 命令提示
execute if entity @a[tag=creative_op,scores={gamerule_beds=1..}] run scoreboard players add "准则" gamerule_beds 1
execute if score "准则" gamerule_beds matches 2.. run scoreboard players set "准则" gamerule_beds 0
execute as @a[tag=!creative_op,scores={gamerule_beds=1..}] run tellraw @s [{"text":"你没有使用该命令的权限","color":"dark_red"}]
execute as @a[tag=creative_op,scores={gamerule_beds=1..}] run tellraw @s [{"text":"命令执行成功，当前参数：","color":"green"},{"score":{"objective":"gamerule_beds","name":"\"准则\""},"color":"green"}]
# 重置
scoreboard players set @a[scores={gamerule_beds=1..}] gamerule_beds 0

# 添加标签
execute as @a[nbt={Dimension:"minecraft:overworld"}] run tag @s add overworld
execute as @a[nbt={Dimension:"minecraft:the_nether"}] run tag @s add the_nether
execute as @a[nbt={Dimension:"minecraft:the_end"}] run tag @s add the_end
# T显
execute if score "准则" gamerule_beds matches 1.. run tellraw @a[tag=overworld,nbt={Inventory:{id:"minecraft:respawn_anchor"}}] {"text":"你不能在这个维度使用这个物品！","color":"dark_red"}
execute if score "准则" gamerule_beds matches 1.. run tellraw @a[tag=the_end,nbt={Inventory:{id:"minecraft:respawn_anchor"}}] {"text":"你不能在这个维度使用这个物品！","color":"dark_red"}
# 删除物品
execute if score "准则" gamerule_beds matches 1.. run clear @a[tag=overworld] minecraft:respawn_anchor
execute if score "准则" gamerule_beds matches 1.. run clear @a[tag=the_nether] #minecraft:beds
execute if score "准则" gamerule_beds matches 1.. run clear @a[tag=the_end] minecraft:respawn_anchor
execute if score "准则" gamerule_beds matches 1.. run clear @a[tag=the_end] #minecraft:beds
# 重置标签
tag @a remove overworld
tag @a remove the_nether
tag @a remove the_end