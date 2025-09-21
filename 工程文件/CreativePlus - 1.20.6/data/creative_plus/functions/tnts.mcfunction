# 添加trigger
scoreboard objectives add gamerule_tnts trigger
scoreboard players enable @a gamerule_tnts
# 命令提示
execute if entity @a[tag=creative_op,scores={gamerule_tnts=1..}] run scoreboard players add "准则" gamerule_tnts 1
execute if score "准则" gamerule_tnts matches 2.. run scoreboard players set "准则" gamerule_tnts 0
execute as @a[tag=!creative_op,scores={gamerule_tnts=1..}] run tellraw @s [{"text":"你没有使用该命令的权限","color":"dark_red"}]
execute as @a[tag=creative_op,scores={gamerule_tnts=1..}] run tellraw @s [{"text":"命令执行成功，当前参数：","color":"green"},{"score":{"objective":"gamerule_tnts","name":"\"准则\""},"color":"green"}]
# 重置
scoreboard players set @a[scores={gamerule_tnts=1..}] gamerule_tnts 0

# 将tnt和矿车变成苦力怕
execute if score "准则" gamerule_tnts matches 1.. as @e[type=minecraft:tnt,nbt={fuse:1s}] at @a run summon minecraft:creeper ~ ~ ~ {Fuse:1,ExplosionRadius:0,ignited:true}
execute if score "准则" gamerule_tnts matches 1.. as @e[type=minecraft:tnt,nbt={fuse:1s}] run kill @s
execute if score "准则" gamerule_tnts matches 1.. as @e[type=minecraft:tnt_minecart,nbt={TNTFuse:1}] at @a run summon minecraft:creeper ~ ~ ~ {Fuse:1,ExplosionRadius:0,ignited:true}
execute if score "准则" gamerule_tnts matches 1.. as @e[type=minecraft:tnt_minecart,nbt={TNTFuse:1}] run kill @s