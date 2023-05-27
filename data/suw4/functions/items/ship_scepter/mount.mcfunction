#===< Make player the rider >===
tag @s add ship_rider
function suw4:items/ship_scepter/damage

#===< Effect >===
playsound minecraft:entity.ender_dragon.flap player @a ~ ~ ~ 1 1.5
function suw4:particles/ship_summon

#===< Summon Rideable ship >===
summon armor_stand ~ ~ ~ {Small:1b,Invisible:1b,Tags:["ship_rideable"],ArmorItems:[{},{},{},{id:"minecraft:netherite_sword",Count:1b,tag:{CustomModelData:1}}]}
scoreboard players add @e[tag=ship_rideable] ship_speed 0
effect give @s minecraft:invisibility 999999 1 true
ride @s mount @e[tag=ship_rideable,sort=nearest,limit=1]