#===< General >===
data merge entity @s {Pose:{Head:[0.0f,0.0f,0.0f]}}
execute if block ~ ~-1 ~ #queen_bee:nonsolid run summon item ~ ~ ~ {Motion:[0d,0.2d,0d],Item:{id:"armor_stand",Count:1b,tag:{CustomModelData:230100,queen_bee:"bee_larva",display:{Name:'{"text":"Bee Larva","italic": false}'},EntityTag:{DisabledSlots:2031616,Tags:["queen_bee_larva"],ArmorItems:[{},{},{},{id:"yellow_dye",Count:1b,tag:{CustomModelData:230103}}],Pose:{Head:[0f,0f,0f]},Silent:1b,Invisible:1b,NoAI:1b,ActiveEffects:[{Id:14,Duration:2000,ShowParticles:0b}]}}}}
execute if block ~ ~-1 ~ #queen_bee:nonsolid run kill @s

#===< Timer >===
execute if block ~ ~-1 ~ minecraft:honeycomb_block run scoreboard players add @s bee_tick 1
execute if block ~ ~-1 ~ minecraft:honeycomb_block run playsound minecraft:block.honey_block.hit block @a ~ ~ ~
execute if block ~ ~-1 ~ minecraft:honeycomb_block run particle block honey_block ~ ~ ~ 0.3 0.3 0.3 1 1
execute as @s[scores={bee_tick=400..}] run data modify entity @s ArmorItems[3].tag.CustomModelData set value 230104
execute as @s[scores={bee_tick=800..}] run data modify entity @s ArmorItems[3].tag.CustomModelData set value 230105

execute as @s[scores={bee_tick=1200..}] run playsound minecraft:item.honeycomb.wax_on hostile @a ~ ~ ~ 2 1
execute as @s[scores={bee_tick=1200..}] run playsound minecraft:entity.bee.death hostile @a ~ ~ ~ 2 0.8
execute as @s[scores={bee_tick=1200..}] run particle block honey_block ~ ~ ~ 0.8 0.8 0.8 1 200
execute as @s[scores={bee_tick=1200..}] positioned ~ ~1 ~ run function queen_bee:summon/queen_bee
execute as @s[scores={bee_tick=1200..}] run kill @s

