# 添加计分板
scoreboard objectives add creative_help trigger
scoreboard players enable @a creative_help


# T显
tellraw @a[scores={creative_help=1..}] {"text":"欢迎使用Creative+","color":"green"}
tellraw @a[scores={creative_help=1..}] {"text":"作者：FeSo4a","color":"light_purple"}

tellraw @a[scores={creative_help=1..}] {"text":"非op玩家指令：","color":"aqua"}
tellraw @a[scores={creative_help=1..}] {"text":"/trigger creative_gamemode set <值>","color":"aqua"}
tellraw @a[scores={creative_help=1..}] {"text":"<值>=1 -> 创造","color":"aqua"}
tellraw @a[scores={creative_help=1..}] {"text":"<值>=2 -> 生存","color":"aqua"}
tellraw @a[scores={creative_help=1..}] {"text":"<值>=3 -> 冒险","color":"aqua"}
tellraw @a[scores={creative_help=1..}] {"text":"<值>=4 -> 旁观","color":"aqua"}
tellraw @a[scores={creative_help=1..}] {"text":"/trigger night_vision -> 开启/关闭无限夜视","color":"aqua"}

tellraw @a[scores={creative_help=1..}] {"text":"op玩家指令：","color":"yellow"}
tellraw @a[scores={creative_help=1..}] {"text":"/trigger gamerule_login -> 开关进入提示","color":"yellow"}
tellraw @a[scores={creative_help=1..}] {"text":"/trigger gamerule_gamemode -> 开关非op调整游戏模式的使用","color":"yellow"}
tellraw @a[scores={creative_help=1..}] {"text":"/trigger gamerule_tnts -> 开关tnt爆炸以及是否清除末地水晶","color":"yellow"}
tellraw @a[scores={creative_help=1..}] {"text":"/trigger gamerule_clear -> 开关是否允许掉落物","color":"yellow"}
tellraw @a[scores={creative_help=1..}] {"text":"/trigger gamerule_beds -> 开关是否能在不同维度下使用重生方块","color":"yellow"}
tellraw @a[scores={creative_help=1..}] {"text":"/trigger gamerule_night_vision -> 开关非op无限夜视的使用","color":"yellow"}
tellraw @a[scores={creative_help=1..}] {"text":"/trigger gamerule_nbt -> 开关nbt检测","color":"yellow"}
tellraw @a[scores={creative_help=1..}] {"text":"/trigger gamerule_eggs -> 开关鸡蛋、刷怪蛋检测","color":"yellow"}

tellraw @a[scores={creative_help=1..}] {"text":"原版指令：","color":"red"}
tellraw @a[scores={creative_help=1..}] {"text":"/gamerule mobGriefing true/false -> 打开/关闭生物破坏","color":"red"}
tellraw @a[scores={creative_help=1..}] {"text":"/gamerule doFireTick true/false -> 打开/关闭火焰蔓延","color":"red"}
tellraw @a[scores={creative_help=1..}] {"text":"/tag <玩家名> add/remove creative_op -> 给予/撤销玩家管理员","color":"red"}
tellraw @a[scores={creative_help=1..}] {"text":"/tag <玩家名> add creative_ban -> 封禁玩家，若玩家已经被封禁则解封","color":"red"}
tellraw @a[scores={creative_help=1..}] {"text":"/function creative_plus:reset 将所有参数都设为1（初次使用请手动输入重置）","color":"red"}

tellraw @a[scores={creative_help=1..}] {"text":"小贴士：输入命令时按下Tab键可以自动补全命令参数","color":"blue"}


# 重置
scoreboard players set @a[scores={creative_help=1..}] creative_help 0