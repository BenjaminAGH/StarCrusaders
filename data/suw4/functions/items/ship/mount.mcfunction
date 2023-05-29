#Rider Player
tag @s add ship_rider
function suw4:items/ship/damage

#Effect's
playsound minecraft:entity.ender_dragon.flap player @a ~ ~ ~ 1 1.5
function suw4:particles/ship_summon

#Summon Ship
summon villager ~ ~ ~ {Tags:["ship_rideable"],Silent:1b,ArmorItems:[{},{},{},{id:"minecraft:netherite_sword",Count:1b,tag:{CustomModelData:1}}]}
scoreboard players add @e[tag=ship_rideable] ship_speed 0
effect give @e[tag=ship_rideable] minecraft:invisibility 999999 1 true
effect give @e[tag=ship_rideable] minecraft:resistance 999999 3 true

effect give @s minecraft:invisibility 999999 1 true
effect give @s minecraft:resistance 999999 3 true
ride @s mount @e[tag=ship_rideable,sort=nearest,limit=1]